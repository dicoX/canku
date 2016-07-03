var queryConditions = {
	matchCon: ""
},
	SYSTEM = system = parent.SYSTEM,
	hiddenAmount = !1,
	billRequiredCheck = system.billRequiredCheck,
	urlParam = Public.urlParam();
queryConditions.transType = "150602" === urlParam.transType ? "150602" : "150601";
var THISPAGE = {
	init: function() {
		SYSTEM.isAdmin !== !1 || SYSTEM.rights.AMOUNT_OUTAMOUNT || (hiddenAmount = !0), this.initDom(), this.loadGrid(), this.addEvent()
	},
	initDom: function() {
		this.$_matchCon = $("#matchCon"), this.$_beginDate = $("#beginDate").val(system.beginDate), this.$_endDate = $("#endDate").val(system.endDate), this.$_matchCon.placeholder(), this.$_beginDate.datepicker(), this.$_endDate.datepicker()
	},
	loadGrid: function() {
		function a(a, b, c) {
			var d = '<div class="operating" data-id="' + c.id + '"><a class="ui-icon ui-icon-pencil" title="編輯"></a><a class="ui-icon ui-icon-trash" title="刪除"></a></div>';
			return d
		}
		var b = Public.setGrid();
		queryConditions.beginDate = this.$_beginDate.val(), queryConditions.endDate = this.$_endDate.val();
		var c = "150601" == queryConditions.transType ? "收" : "退",
			d = [{
				name: "operating",
				label: "操作",
				width: 60,
				fixed: !0,
				formatter: a,
				align: "center",
				sortable: !1
			}, {
				name: "billDate",
				label: "單據日期",
				index: "billDate",
				width: 100,
				align: "center"
			}, {
				name: "billNo",
				label: "單據編號",
				index: "billNo",
				width: 150,
				align: "center"
			}, {
				name: "salesName",
				label: "銷售員",
				width: 80
			}, {
				name: "contactName",
				label: "客戶",
				index: "contactName",
				width: 150
			}, {
				name: "totalAmount",
				label: "銷售金額",
				hidden: hiddenAmount,
				index: "totalAmount",
				width: 80,
				align: "right",
				formatter: "currency"
			}, {
				name: "amount",
				label: "優惠后金額",
				hidden: hiddenAmount,
				index: "amount",
				width: 100,
				align: "right",
				formatter: "currency"
			}, {
				name: "rpAmount",
				label: "已" + c + "款",
				hidden: hiddenAmount,
				index: "rpAmount",
				width: 80,
				align: "right",
				formatter: "currency"
			}, {
				name: "hxStateCode",
				label: c + "款狀態",
				width: 80,
				fixed: !0,
				align: "center",
				title: !0,
				classes: "ui-ellipsis",
				formatter: function(a) {
					switch (a) {
					case 0:
						return "未" + c + "款";
					case 1:
						return "部分" + c + "款";
					case 2:
						return "全部" + c + "款";
					default:
						return "&#160"
					}
				}
			}, {
				name: "userName",
				label: "制單員",
				index: "userName",
				width: 80,
				fixed: !0,
				align: "center",
				title: !0,
				classes: "ui-ellipsis"
			}, {
				name: "checkName",
				label: "審覈員",
				index: "checkName",
				width: 80,
				hidden: billRequiredCheck ? !1 : !0,
				fixed: !0,
				align: "center",
				title: !0,
				classes: "ui-ellipsis"
			}, {
				name: "description",
				label: "備註",
				index: "description",
				width: 180,
				title: !0,
				classes: "ui-ellipsis",
				sortable: !1
			}, {
				name: "disEditable",
				label: "不可編輯",
				index: "disEditable",
				hidden: !0
			}];
		$("#grid").jqGrid({
			url: "../scm/invSa?action=list",
			postData: queryConditions,
			datatype: "json",
			autowidth: !0,
			height: b.h,
			altRows: !0,
			gridview: !0,
			multiselect: !0,
			colModel: d,
			cmTemplate: {
				sortable: !0,
				title: !1
			},
			page: 1,
			pager: "#page",
			rowNum: 100,
			rowList: [100, 200, 500],
			viewrecords: !0,
			shrinkToFit: !1,
			forceFit: !1,
			jsonReader: {
				root: "data.rows",
				records: "data.records",
				total: "data.total",
				repeatitems: !1,
				id: "id"
			},
			loadComplete: function(a) {
				if (billRequiredCheck) for (var b = a.data.rows, c = 0; c < b.length; c++) {
					var d = b[c];
					d.checked || $("#" + d.id).addClass("gray")
				}
				"150602" == queryConditions.transType && $("#grid").find(".jqgrow").addClass("red")
			},
			loadError: function() {},
			ondblClickRow: function(a) {
				$("#" + a).find(".ui-icon-pencil").trigger("click")
			}
		})
	},
	reloadData: function(a) {
		$("#grid").jqGrid("setGridParam", {
			datatype: "json",
			postData: a
		}).trigger("reloadGrid")
	},
	addEvent: function() {
		var a = this;
		if ($(".grid-wrap").on("click", ".ui-icon-pencil", function(a) {
			a.preventDefault();
			var b = $(this).parent().data("id"),
				c = $("#grid").jqGrid("getRowData", b),
				d = 1 == c.disEditable ? "&disEditable=true" : "",
				e = ($("#grid").jqGrid("getDataIDs"), "出貨單"),
				f = "sales-sales";
			if ("150602" == queryConditions.transType) {
				var e = "銷售退貨單",
					f = "sales-salesBack";
				parent.cacheList.salesBackId = $("#grid").jqGrid("getDataIDs")
			} else parent.cacheList.salesId = $("#grid").jqGrid("getDataIDs");
			parent.tab.addTabItem({
				tabid: f,
				text: e,
				url: "../scm/invSa?action=editSale&id=" + b + "&flag=list" + d + "&transType=" + queryConditions.transType
			})
		}), $(".grid-wrap").on("click", ".ui-icon-trash", function(a) {
			if (a.preventDefault(), Business.verifyRight("SA_DELETE")) {
				var b = $(this).parent().data("id");
				$.dialog.confirm("確定要刪除此出貨記錄？", function() {
					Public.ajaxGet("../scm/invSa/delete?action=delete", {
						id: b
					}, function(a) {
						200 === a.status ? ($("#grid").jqGrid("delRowData", b), parent.Public.tips({
							content: "刪除完畢！"
						})) : parent.Public.tips({
							type: 1,
							content: a.msg
						})
					})
				})
			}
		}), $(".wrapper").on("click", "#print", function(a) {
			a.preventDefault(), Business.verifyRight("SA_PRINT") && Public.print({
				title: "出貨單列表",
				$grid: $("#grid"),
				pdf: "../scm/invSa/toPdf?action=toPdf",
				billType: 10201,
				filterConditions: queryConditions
			})
		}), $(".wrapper").on("click", "#import", function(a) {
			var b = queryConditions.transType;
			a.preventDefault(), Business.verifyRight("SA_IMPORT") && parent.$.dialog({
				width: 560,
				height: 300,
				title: "批量導入",
				content: "url:/sales/import.jsp?type=sa&transType=" + b,
				lock: !0
			})
		}), $(".wrapper").on("click", "#export", function(a) {
			if (!Business.verifyRight("SA_EXPORT")) return void a.preventDefault();
			var b = $("#grid").jqGrid("getGridParam", "selarrrow"),
				c = b.join(),
				d = c ? "&id=" + c : "";
			for (var e in queryConditions) queryConditions[e] && (d += "&" + e + "=" + queryConditions[e]);
			var f = "../scm/invSa/exportInvSa?action=exportInvSa" + d;
			$(this).attr("href", f)
		}), billRequiredCheck) {
			{
				$("#audit").css("display", "inline-block"), $("#reAudit").css("display", "inline-block")
			}
			$(".wrapper").on("click", "#audit", function(a) {
				a.preventDefault();
				var b = $("#grid").jqGrid("getGridParam", "selarrrow"),
					c = b.join();
				return c ? void Public.ajaxPost("../scm/invSa/batchCheckInvSa?action=batchCheckInvSa", {
					id: c
				}, function(a) {
					if (200 === a.status) {
						for (var c = 0, d = b.length; d > c; c++) $("#grid").setCell(b[c], "checkName", system.realName), $("#" + b[c]).removeClass("gray");
						parent.Public.tips({
							content: "審覈完畢！"
						})
					} else parent.Public.tips({
						type: 1,
						content: a.msg
					})
				}) : void parent.Public.tips({
					type: 2,
					content: "請選擇需要審覈的清單！"
				})
			}), $(".wrapper").on("click", "#reAudit", function(a) {
				a.preventDefault();
				var b = $("#grid").jqGrid("getGridParam", "selarrrow"),
					c = b.join();
				return c ? void Public.ajaxPost("../scm/invSa/rsBatchCheckInvSa?action=rsBatchCheckInvSa", {
					id: c
				}, function(a) {
					if (200 === a.status) {
						for (var c = 0, d = b.length; d > c; c++) $("#grid").setCell(b[c], "checkName", "&#160;"), $("#" + b[c]).addClass("gray");
						parent.Public.tips({
							content: "反審覈完畢！"
						})
					} else parent.Public.tips({
						type: 1,
						content: a.msg
					})
				}) : void parent.Public.tips({
					type: 2,
					content: "請選擇需要反審覈的清單！"
				})
			})
		}
		$("#search").click(function() {
			queryConditions.salesId = null, queryConditions.matchCon = "請輸入單據編號/客戶名稱/備註" === a.$_matchCon.val() ? "" : $.trim(a.$_matchCon.val()), queryConditions.beginDate = a.$_beginDate.val(), queryConditions.endDate = a.$_endDate.val(), THISPAGE.reloadData(queryConditions)
		}), $("#moreCon").click(function() {
			queryConditions.matchCon = a.$_matchCon.val(), queryConditions.beginDate = a.$_beginDate.val(), queryConditions.endDate = a.$_endDate.val(), $.dialog({
				id: "moreCon",
				lock: !0,
				width: 480,
				height: 300,
				min: !1,
				max: !1,
				title: "高級檢索",
				button: [{
					name: "確定",
					focus: !0,
					callback: function() {
						queryConditions = this.content.handle(queryConditions), THISPAGE.reloadData(queryConditions), "" !== queryConditions.matchCon && a.$_matchCon.val(queryConditions.matchCon), a.$_beginDate.val(queryConditions.beginDate), a.$_endDate.val(queryConditions.endDate)
					}
				}, {
					name: "取消"
				}],
				resize: !1,
				content: "url:../sales/sales_search?type=sales",
				data: queryConditions
			})
		}), $("#refresh").click(function() {
			THISPAGE.reloadData(queryConditions)
		}), $("#add").click(function(a) {
			if (a.preventDefault(), Business.verifyRight("SA_ADD")) {
				var b = "出貨單",
					c = "sales-sales";
				if ("150602" == queryConditions.transType) var b = "銷售退貨單",
					c = "sales-salesBack";
				parent.tab.addTabItem({
					tabid: c,
					text: b,
					url: "../scm/invSa?action=initSale&transType=" + queryConditions.transType
				})
			}
		}), $(window).resize(function() {
			Public.resizeGrid()
		})
	}
};
THISPAGE.init();