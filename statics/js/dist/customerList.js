function initDom() {
	catorageCombo = Business.categoryCombo($("#catorage"), {
		editable: !1,
		extraListHtml: "",
		addOptions: {
			value: -1,
			text: "選擇客戶類別"
		},
		defaultSelected: 0,
		trigger: !0,
		width: 120
	}, "customertype")
}
function initGrid() {
	var a = Public.setGrid(),
		b = ["操作", "客戶編號", "客戶名稱", "客戶類型", "聯絡人", "手提電話", "座機", "QQ/MSN", "期初往來餘額", "送貨地址", "狀態"],
		c = !(parent.SYSTEM.isAdmin || parent.SYSTEM.rights.AMOUNT_OUTAMOUNT),
		d = [{
			name: "operate",
			width: 60,
			fixed: !0,
			formatter: Public.operFmatter,
			title: !1
		}, {
			name: "number",
			index: "number",
			width: 100,
			title: !1
		}, {
			name: "name",
			index: "name",
			width: 220,
			classes: "ui-ellipsis"
		}, {
			name: "customerType",
			index: "customerType",
			width: 100,
			fixed: !0,
			title: !1
		}, {
			name: "contacter",
			index: "contacter",
			width: 80,
			align: "center",
			fixed: !0
		}, {
			name: "mobile",
			index: "mobile",
			width: 100,
			align: "center",
			title: !1
		}, {
			name: "telephone",
			index: "telephone",
			width: 100,
			title: !1
		}, {
			name: "linkIm",
			index: "linkIm",
			width: 80,
			title: !1
		}, {
			name: "difMoney",
			index: "difMoney",
			width: 100,
			align: "right",
			title: !1,
			formatter: "currency",
			hidden: c
		}, {
			name: "deliveryAddress",
			index: "deliveryAddress",
			width: 200,
			classes: "ui-ellipsis",
			formatter: function(a, b, c) {
				return (c.province || "") + (c.city || "") + (c.county || "") + (a || "")
			}
		}, {
			name: "delete",
			index: "delete",
			width: 80,
			align: "center",
			formatter: statusFmatter
		}];
	$("#grid").jqGrid({
		url: "../basedata/contact?action=list&isDelete=2",
		datatype: "json",
		autowidth: !0,
		height: a.h,
		altRows: !0,
		gridview: !0,
		onselectrow: !1,
		multiselect: !0,
		colNames: b,
		colModel: d,
		pager: "#page",
		viewrecords: !0,
		cmTemplate: {
			sortable: !1
		},
		rowNum: 100,
		rowList: [100, 200, 500],
		shrinkToFit: !0,
		jsonReader: {
			root: "data.rows",
			records: "data.records",
			total: "data.total",
			repeatitems: !1,
			id: "id"
		},
		loadComplete: function(a) {
			if (a && 200 == a.status) {
				var b = {};
				a = a.data;
				for (var c = 0; c < a.rows.length; c++) {
					var d = a.rows[c];
					b[d.id] = d
				}
				$("#grid").data("gridData", b)
			} else {
				var e = 250 === a.status ? searchFlag ? "沒有檢索到滿足條件的結果！" : "沒有客戶資料數據！" : a.msg;
				parent.Public.tips({
					type: 2,
					content: e
				})
			}
		},
		loadError: function() {
			parent.Public.tips({
				type: 1,
				content: "操作失敗，請檢查網路鏈接是否正常！"
			})
		}
	})
}
function initEvent() {
	$_matchCon = $("#matchCon"), $_matchCon.placeholder(), $("#search").on("click", function(a) {
		a.preventDefault();
		var b = $.trim($_matchCon.val()),
			c = catorageCombo ? catorageCombo.getValue() : -1;
		$("#grid").jqGrid("setGridParam", {
			page: 1,
			postData: {
			skey: b,
			categoryId: c
			}
		}).trigger("reloadGrid")
	}), $("#btn-add").on("click", function(a) {
		a.preventDefault(), Business.verifyRight("BU_ADD") && handle.operate("add")
	}), $("#btn-print").on("click", function(a) {
		a.preventDefault()
	}), $("#btn-import").on("click", function(a) {
		a.preventDefault(), Business.verifyRight("BaseData_IMPORT") && parent.$.dialog({
			width: 560,
			height: 300,
			title: "批量導入",
			content: "url:import",
			lock: !0
		})
	}), $("#btn-export").on("click", function() {
		if (Business.verifyRight("BU_EXPORT")) {
			var a = "輸入客戶編號/ 名稱/ 聯絡人/ 聯絡電話" === $_matchCon.val() ? "" : $.trim($_matchCon.val());
			$(this).attr("href", "../basedata/customer/exporter?action=exporter&isDelete=2&skey=" + a)
		}
	}), $("#grid").on("click", ".operating .ui-icon-pencil", function(a) {
		if (a.preventDefault(), Business.verifyRight("BU_UPDATE")) {
			var b = $(this).parent().data("id");
			handle.operate("edit", b)
		}
	}), $("#grid").on("click", ".operating .ui-icon-trash", function(a) {
		if (a.preventDefault(), Business.verifyRight("BU_DELETE")) {
			var b = $(this).parent().data("id");
			handle.del(b + "")
		}
	}), $("#btn-batchDel").click(function(a) {
		if (a.preventDefault(), Business.verifyRight("BU_DELETE")) {
			var b = $("#grid").jqGrid("getGridParam", "selarrrow");
			b.length ? handle.del(b.join()) : parent.Public.tips({
				type: 2,
				content: " 請選擇需要刪除的項目!"
			})
		}
	}), $("#btn-disable").click(function(a) {
		a.preventDefault();
		var b = $("#grid").jqGrid("getGridParam", "selarrrow").concat();
		return b && 0 != b.length ? void handle.setStatuses(b, !0) : void parent.Public.tips({
			type: 1,
			content: " 請選擇需要停用的客戶！"
		})
	}), $("#btn-enable").click(function(a) {
		a.preventDefault();
		var b = $("#grid").jqGrid("getGridParam", "selarrrow").concat();
		return b && 0 != b.length ? void handle.setStatuses(b, !1) : void parent.Public.tips({
			type: 1,
			content: " 請選擇需要啟用的客戶！"
		})
	}), $("#grid").on("click", ".set-status", function(a) {
		if (a.stopPropagation(), a.preventDefault(), Business.verifyRight("INVLOCTION_UPDATE")) {
			var b = $(this).data("id"),
				c = !$(this).data("delete");
			handle.setStatus(b, c)
		}
	}), $(window).resize(function() {
		Public.resizeGrid()
	})
}
function statusFmatter(a, b, c) {
	var d = 1 == a ? "已停用" : "已啟用",
		e = 1 == a ? "ui-label-default" : "ui-label-success";
	return '<span class="set-status ui-label ' + e + '" data-delete="' + a + '" data-id="' + c.id + '">' + d + "</span>"
}
var searchFlag = !1,
	filterClassCombo, catorageCombo, handle = {
		operate: function(a, b) {
			if ("add" == a) var c = "新增客戶",
				d = {
					oper: a,
					callback: this.callback
				};
			else var c = "編輯客戶資料",
				d = {
					oper: a,
					rowId: b,
					callback: this.callback
				};
			$.dialog({
				title: c,
				content: "url:customer_manage",
				data: d,
				width: 640,
				height: 466,
				max: !1,
				min: !1,
				cache: !1,
				lock: !0
			})
		},
		del: function(a) {
			$.dialog.confirm("刪除的客戶資料將不能恢復，請慎重操作！", function() {
				Public.ajaxPost("../basedata/contact/delete?action=delete", {
					id: a
				}, function(b) {
					if (b && 200 == b.status) {
						var c = b.data.id || [];
						parent.Public.tips(a.split(",").length === c.length ? {
							content: "已經刪除" + c.length + "個客戶資料！"
						} : {
							type: 2,
							content: b.data.msg
						});
						for (var d = 0, e = c.length; e > d; d++) $("#grid").jqGrid("setSelection", c[d]), $("#grid").jqGrid("delRowData", c[d])
					} else parent.Public.tips({
						type: 1,
						content: "刪除客戶資料失敗！" + b.msg
					})
				})
			})
		},
		setStatus: function(a, b) {
			a && Public.ajaxPost("../basedata/contact/disable?action=disable", {
				contactIds: a,
				disable: Number(b)
			}, function(c) {
				c && 200 == c.status ? (parent.Public.tips({
					content: "客戶狀態變更完成！"
				}), $("#grid").jqGrid("setCell", a, "delete", b)) : parent.Public.tips({
					type: 1,
					content: "客戶狀態變更失敗！" + c.msg
				})
			})
		},
		setStatuses: function(a, b) {
			if (a && 0 != a.length) {
				var c = $("#grid").jqGrid("getGridParam", "selarrrow"),
					d = c.join();
				Public.ajaxPost("../basedata/contact/disable?action=disable", {
					contactIds: d,
					disable: Number(b)
				}, function(c) {
					if (c && 200 == c.status) {
						parent.Public.tips({
							content: "客戶狀態變更完成！"
						});
						for (var d = 0; d < a.length; d++) {
							var e = a[d];
							$("#grid").jqGrid("setCell", e, "delete", b)
						}
					} else parent.Public.tips({
						type: 1,
						content: "客戶狀態變更失敗！" + c.msg
					})
				})
			}
		},
		callback: function(a, b, c) {
			var d = $("#grid").data("gridData");
			d || (d = {}, $("#grid").data("gridData", d)), a.difMoney = a.amount - a.periodMoney, d[a.id] = a, "edit" == b ? ($("#grid").jqGrid("setRowData", a.id, a), c && c.api.close()) : ($("#grid").jqGrid("addRowData", a.id, a, "first"), c && c.resetForm(a))
			$(".ui_close").trigger("click");
		}
	};
initDom(), initGrid(), initEvent();



