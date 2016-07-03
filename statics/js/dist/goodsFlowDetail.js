define(["jquery", "print"], function(a) {
	function b() {
		Business.filterGoods(), Business.filterStorage(), l.beginDate && l.endDate && j("div.grid-subtitle").text("日期: " + l.beginDate + "至" + l.endDate), j("#filter-fromDate").val(l.beginDate), j("#filter-toDate").val(l.endDate), j("#filter-goods input").val(l.goodsNo), j("#filter-storage input").val(l.storageNo), Public.dateCheck();
		var a = new Pikaday({
			field: j("#filter-fromDate")[0]
		}),
			b = new Pikaday({
				field: j("#filter-toDate")[0]
			});
		j("#filter-submit").on("click", function(c) {
			c.preventDefault();
			var d = j("#filter-fromDate").val(),
				e = j("#filter-toDate").val(),
				f = a.getDate(),
				g = b.getDate();
			return f.getTime() > g.getTime() ? void parent.Public.tips({
				type: 1,
				content: "起始日期不能大於結束日期"
			}) : (l = {
				beginDate: d,
				endDate: e,
				goodsNo: j("#filter-goods input").val() || "",
				storageNo: j("#filter-storage input").val() || ""
			}, j("#selected-period").text(d + "至" + e), j("div.grid-subtitle").text("日期: " + d + " 至 " + e), void i())
		}), j("#filter-reset").on("click", function(a) {
			a.preventDefault(), j("#filter-fromDate").val(""), j("#filter-toDate").val(""), j("#filter-goods input").val(""), j("#filter-storage input").val("")
		})
	}
	function c() {
		var a = l.storage ? l.storage.split(",") : "",
			b = l.goods ? l.goods.split(",") : "",
			c = "";
		a && b ? c = "「已選擇<b>" + a.length + "</b>個倉庫，<b>" + b.length + "</b>個商品進行查詢」" : a ? c = "「已選擇<b>" + customer.length + "</b>個倉庫進行查詢」" : b && (c = "「已選擇<b>" + b.length + "</b>個商品進行查詢」"), j("#cur-search-tip").html(c)
	}
	function d() {
		j("#refresh").on("click", function(a) {
			a.preventDefault(), i()
		}), j("#btn-print").click(function(a) {
			a.preventDefault(), Business.verifyRight("DeliverDetailReport_PRINT") && j("div.ui-print").printTable()
		}), j("#btn-export").click(function(a) {
			if (a.preventDefault(), Business.verifyRight("DeliverDetailReport_EXPORT")) {
				var b = {};
				for (var c in l) l[c] && (b[c] = l[c]);
				Business.getFile("../report/deliverDetail_exporter?action=exporter", b)
			}
		})
	}
	function e() {
		var a = !1,
			b = !1,
			c = !1;
		k.isAdmin !== !1 || k.rights.AMOUNT_COSTAMOUNT || (a = !0), k.isAdmin !== !1 || k.rights.AMOUNT_OUTAMOUNT || (b = !0), k.isAdmin !== !1 || k.rights.AMOUNT_INAMOUNT || (c = !0);
		var d = [{
			name: "invNo",
			label: "商品編碼",
			frozen: !0,
			width: 80
		}, {
			name: "invName",
			label: "商品名稱",
			frozen: !0,
			width: 200,
			classes: "ui-ellipsis",
			title: !0
		}, {
			name: "spec",
			label: "規格型號",
			frozen: !0,
			width: 60,
			align: "center"
		}, {
			name: "unit",
			label: "單位",
			frozen: !0,
			width: 50,
			fixed: !0,
			align: "center"
		}, {
			name: "date",
			label: "日期",
			frozen: !0,
			width: 80,
			fixed: !0,
			align: "center"
		}, {
			name: "billNo",
			label: "單據編號",
			frozen: !0,
			width: 120,
			fixed: !0,
			align: "center"
		}, {
			name: "billId",
			label: "銷售ID",
			width: 0,
			hidden: !0
		}, {
			name: "billType",
			label: "銷售類型",
			width: 0,
			hidden: !0
		}, {
			name: "transType",
			label: "業務分類",
			width: 60,
			fixed: !0,
			align: "center"
		}, {
			name: "buName",
			label: "來往單位",
			width: 100,
			classes: "ui-ellipsis",
			title: !0
		}, {
			name: "location",
			label: "倉庫",
			width: 60,
			classes: "ui-ellipsis",
			title: !0
		}, {
			name: "inqty",
			label: "數量",
			width: 80,
			fixed: !0,
			align: "right"
		},
//		{
//			name: "inunitCost",
//			label: "单位成本",
//			width: 80,
//			fixed: !0,
//			hidden: c,
//			align: "right"
//		}, 
//		{
//			name: "incost",
//			label: "成本",
//			width: 80,
//			fixed: !0,
//			hidden: c,
//			align: "right"
//		},
		
		{
			name: "outqty",
			label: "數量",
			width: 80,
			fixed: !0,
			align: "right"
		}, 
//		{
//			name: "outunitCost",
//			label: "单位成本",
//			width: 80,
//			fixed: !0,
//			hidden: b,
//			align: "right"
//		}, 
//		{
//			name: "outcost",
//			label: "成本",
//			width: 80,
//			fixed: !0,
//			hidden: b,
//			align: "right"
//		}, 
		
		{
			name: "totalqty",
			label: "數量",
			width: 80,
			fixed: !0,
			align: "right"
		} 
		
//		{
//			name: "totalunitCost",
//			label: "单位成本",
//			width: 80,
//			fixed: !0,
//			hidden: a,
//			align: "right"
//		}, {
//			name: "totalcost",
//			label: "成本",
//			width: 80,
//			fixed: !0,
//			hidden: a,
//			align: "right"
//		}
		],
			e = "local",
			g = "#";
		l.autoSearch && (e = "json", g = "../report/deliverDetail?action=detail"), j("#grid").jqGrid({
			url: g,
			postData: l,
			datatype: e,
			autowidth: !0,
			height: "auto",
			gridview: !0,
			colModel: d,
			cmTemplate: {
				sortable: !1,
				title: !1
			},
			page: 1,
			sortname: "date",
			sortorder: "desc",
			rowNum: 3e3,
			loadonce: !0,
			viewrecords: !0,
			shrinkToFit: !1,
			footerrow: !0,
			userDataOnFooter: !0,
			jsonReader: {
				root: "data.rows",
				records: "data.records",
				total: "data.total",
				userdata: "data.userdata",
				repeatitems: !1,
				id: "0"
			},
			ondblClickRow: function(a) {
				var b = j("#grid").getRowData(a),
					c = b.billId,
					d = b.billType;
				switch (d) {
				case "PUR":
					if (!Business.verifyRight("PU_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "purchase-purchase",
						text: "入貨單",
						url: "../scm/invPu?action=editPur&id="+ c
					});
					break;
				case "SALE":
					if (!Business.verifyRight("SA_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "sales-sales",
						text: "出貨單",
						url: "../scm/invSa?action=editSale&id="+ c
					});
					break;
				case "TRANSFER":
					if (!Business.verifyRight("TF_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "storage-transfers",
						text: "調撥單",
						url: "../scm/invTf?action=editTf&id=" + c
					});
					break;
				case "OI":
					if (!Business.verifyRight("IO_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "storage-otherWarehouse",
						text: "其他入庫",
						url: "../scm/invOi?action=editOi&type=in&id=" + c
					});
					break;
				case "OO":
					if (!Business.verifyRight("OO_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "storage-otherOutbound",
						text: "其他出庫",
						url: "../scm/invOi?action=editOi&type=out&id=" + c
					});
					break;
				case "CADJ":
					if (!Business.verifyRight("CADJ_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "storage-adjustment",
						text: "成本調整單",
						url: "../scm/invOi?action=editOi&type=cbtz&id=" + c
					});
					break;
				case "ZZD":
					if (!Business.verifyRight("ZZD_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "storage-assemble",
						text: "組裝單",
						url: "/storage/assemble.jsp?id=" + c
					});
					break;
				case "CXD":
					if (!Business.verifyRight("CXD_QUERY")) return;
					parent.tab.addTabItem({
						tabid: "storage-disassemble",
						text: "拆卸單",
						url: "/storage/disassemble.jsp?id=" + c
					})
				}
			},
			loadComplete: function(a) {
				var b;
				if (a && a.data) {
					var c = a.data.rows.length;
					b = c ? 31 * c : "auto"
				}
				f(b)
			},
			gridComplete: function() {
				j("#grid").footerData("set", {
					location: "合計："
				}), j("table.ui-jqgrid-ftable").find('td[aria-describedby="grid_location"]').prevUntil().css("border-right-color", "#fff")
			}
		}).jqGrid("setGroupHeaders", {
			useColSpanStyle: !0,
			groupHeaders: [{
				startColumnName: "inqty",
				numberOfColumns: 1,
				titleText: "入庫"
			}, {
				startColumnName: "outqty",
				numberOfColumns: 1,
				titleText: "出庫"
			}, {
				startColumnName: "totalqty",
				numberOfColumns: 1,
				titleText: "結存"
			}]
		}).jqGrid("setFrozenColumns"), l.autoSearch ? (j(".no-query").remove(), j(".ui-print").show()) : j(".ui-print").hide()
	}
	function f(a) {
		a && (f.h = a);
		var b = g(),
			c = f.h,
			d = h(),
			e = j("#grid");
		c > d && (c = d), b < e.width() && (c += 17), e.jqGrid("setGridWidth", b, !1), e.jqGrid("setGridHeight", c), j("#grid-wrap").height(function() {
			return document.body.clientHeight - this.offsetTop - 36 - 5
		})
	}
	function g() {
		return j(window).width() - (g.offsetLeft || (g.offsetLeft = j("#grid-wrap").offset().left)) - 36 - 20
	}
	function h() {
		return j(window).height() - (h.offsetTop || (h.offsetTop = j("#grid").offset().top)) - 36 - 16 - 24
	}
	function i() {
		j(".no-query").remove(), j(".ui-print").show(), j("#grid").jqGrid("setGridParam", {
			datatype: "json",
			postData: l,
			url: "../report/deliverDetail?action=detail"
		}).trigger("reloadGrid")
	}
	var j = a("jquery"),
		k = parent.SYSTEM,
		l = j.extend({
			beginDate: "",
			endDate: "",
			goodsNo: "",
			storageNo: ""
		}, Public.urlParam());
	a("print"), b(), c(), d(), e();
	var m;
	j(window).on("resize", function() {
		m || (m = setTimeout(function() {
			f(), m = null
		}, 50))
	})
});