$(function() {
	function a() {
		c.jqGrid({
			colNames: ["操作", "戶口編號", "戶口名稱", "當前餘額", "其初餘額", "建賬日期", "戶口分類"],
			colModel: [{
				name: "operate",
				width: 60,
				fixed: !0,
				align: "center",
				formatter: Public.operFmatter
			}, {
				name: "number",
				width: 150
			}, {
				name: "name",
				width: 350
			}, {
				name: "amountOver",
				width: 100,
				align: "right",
				formatter: "currency"
			}, {
				name: "amount",
				width: 100,
				align: "right",
				formatter: "currency"
			}, {
				name: "date",
				width: 150,
				align: "center",
				formatter: function(a) {
					return a
				}
			}, {
				name: "type",
				width: 100,
				align: "center",
				formatter: function(a) {
					var b = "";
					switch (a) {
					case 1:
						b = "現金";
						break;
					case 2:
						b = "銀行存款"
					}
					return b
				}
			}],
			url: "../basedata/settAcct?action=list",
			datatype: "json",
			height: Public.setGrid().h,
			altRows: !0,
			gridview: !0,
			autowidth: !0,
			pager: "#page",
			viewrecords: !0,
			cmTemplate: {
				sortable: !1,
				title: !1
			},
			page: 1,
			rowNum: 3e3,
			shrinkToFit: !1,
			scroll: 1,
			jsonReader: {
				root: "data.items",
				records: "data.totalsize",
				repeatitems: !1,
				id: "id"
			},
			loadComplete: function(a) {
				if (a && 200 == a.status) {
					var b = {},
						c = "";
					a = a.data;
					for (var d = 0; d < a.items.length; d++) {
						var e = a.items[d];
						b[e.id] = e, c += c ? "," + e.id : e.id
					}
					$("#grid").data("gridData", b), 0 == a.items.length && parent.Public.tips({
						type: 2,
						content: "沒有戶口資料！"
					}), Public.ajaxPost("../basedata/settAcct/findAmountOver?action=findAmountOver", {
						ids: c
					}, function(a) {
						if (a && 200 == a.status) for (var b = 0; b < a.data.items.length; b++) {
							var c = a.data.items[b];
							$("#grid").jqGrid("setCell", c.id, "amountOver", c.amountOver)
						} else parent.Public.tips({
							type: 1,
							content: "獲取當前餘額失敗！" + a.msg
						})
					})
				} else parent.Public.tips({
					type: 2,
					content: "獲取戶口數據失敗！" + a.msg
				})
			},
			loadError: function() {
				parent.Public.tips({
					type: 1,
					content: "操作失敗，請檢查網絡連接是否正確！"
				})
			}
		})
	}
	function b() {
		$("#btn-refresh").click(function(a) {
			a.preventDefault(), d.operate("refresh")
		}), $("#btn-add").click(function(a) {
			a.preventDefault(), d.operate("add")
		}), c.on("click", ".operating .ui-icon-pencil", function(a) {
			a.preventDefault(), d.operate("edit", $(this).parent().data("id"))
		}), c.on("click", ".operating .ui-icon-trash", function(a) {
			a.preventDefault(), d.operate("del", $(this).parent().data("id"))
		}), c.on("click", ".set-status", function(a) {
			a.preventDefault(), d.operate("setStatus", $(this).parent().data("id"))
		}), $(window).resize(function() {
			Public.resizeGrid()
		})
	}
	var c = $("#grid"),
		d = {
			operate: function(a, b) {
				switch (a) {
				case "add":
					if (!Business.verifyRight("SettAcct_ADD")) return;
					this.pop("新增結算戶口", {
						oper: a,
						callback: this.callback
					}, "url:settlementAccount_manager");
					break;
				case "edit":
					if (!Business.verifyRight("SettAcct_UPDATE")) return;
					var d = this;
					Public.ajaxPost("../basedata/settAcct/query?action=query", {
						id: b
					}, function(b) {
						return 200 != b.status ? void parent.parent.Public.tips({
							type: 1,
							content: msg + "失敗" + b.msg
						}) : void d.pop("變更結算戶口", {
							oper: a,
							rowData: b.data,
							callback: d.callback
						}, "url:settlementAccount_manager")
					});
					break;
				case "del":
					if (!Business.verifyRight("SettAcct_DELETE")) return;
					$.dialog.confirm("刪除的戶口資料將不能恢復，請慎重操作！", function() {
						Public.ajaxPost("../basedata/settAcct/delete?action=delete", {
							id: b
						}, function(a) {
							a && 200 == a.status ? (parent.Public.tips({
								content: "戶口刪除完成！"
							}), $("#grid").jqGrid("delRowData", b)) : parent.Public.tips({
								type: 1,
								content: "戶口刪除失敗！" + a.msg
							})
						})
					});
					break;
				case "setStatus":
					break;
				case "refresh":
					c.trigger("reloadGrid");
					break;
				default:
					Public.tips({
						type: 1,
						centent: "未知操作！"
					})
				}
			},
			callback: function(a, b, c) {
				var d = $("#grid").data("gridData");
				d || (d = {}, $("#grid").data("gridData", d)), d[a.id] = a, "edit" == b ? ($("#btn-refresh").trigger("click"), c && c.api.close()) : ($("#grid").jqGrid("addRowData", a.id, a, "last"), c && c.resetForm(a))
			},
			pop: function(a, b, c) {
				$.dialog({
					title: a,
					content: c,
					data: b,
					width: 640,
					height: 330,
					min: !1,
					max: !1,
					cache: !1,
					lock: !0
				})
			}
		};
	a(), b()
});