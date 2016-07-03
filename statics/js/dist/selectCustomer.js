function callback() {
	var a = Public.getDefaultPage(),
		b = $("#grid").jqGrid("getGridParam", "selrow");
	if (b && b.length > 0) {
		var c = $("#grid").jqGrid("getRowData", b);
		c.id = b;
		var d = c.number + " " + c.name,
			e = parent.THISPAGE.$_customer;
		e.find("input").val(d), e.data("contactInfo", c), api.data.type && a.SYSTEM[api.data.type].push(c)
	}
}
var urlParam = Public.urlParam(),
	zTree, defaultPage = Public.getDefaultPage(),
	SYSTEM = defaultPage.SYSTEM,
	taxRequiredCheck = SYSTEM.taxRequiredCheck,
	taxRequiredInput = SYSTEM.taxRequiredInput,
	api = frameElement.api,
	queryConditions = {
		skey: api.data.skey || ""
	},
	THISPAGE = {
		init: function() {
			this.initDom(), this.loadGrid(), this.addEvent()
		},
		initDom: function() {
			this.$_matchCon = $("#matchCon"), this.$_matchCon.placeholder(), this.$_catorage = $("#catorage"), queryConditions.skey && this.$_matchCon.val(queryConditions.skey);
			var a = "customertype",
				b = "筛选客戶類型";
			"10" === urlParam.type && (a = "supplytype", b = "筛选供應商類型"), this.catorageCombo = Business.categoryCombo(this.$_catorage, {
				editable: !1,
				extraListHtml: "",
				addOptions: {
					value: -1,
					text: b
				},
				defaultSelected: 0,
				trigger: !0,
				width: 120
			}, a)
		},
		loadGrid: function() {
			var a = "../basedata/contact?action=list&isDelete=2";
			"10" === urlParam.type && (a += "&type=10");
			var b = ($(window).height() - $(".grid-wrap").offset().top - 84, [{
				name: "customerType",
				label: "類別",
				index: "customerType",
				width: 100,
				title: !1
			}, {
				name: "number",
				label: "編號",
				index: "number",
				width: 100,
				title: !1
			}, {
				name: "name",
				label: "名稱",
				index: "name",
				width: 220,
				classes: "ui-ellipsis"
			}, {
				name: "contacter",
				label: "聯絡人",
				index: "contacter",
				width: 100,
				align: "center",
				classes: "ui-ellipsis"
			}, {
				name: "mobile",
				label: "手提電話",
				index: "mobile",
				width: 100,
				align: "center",
				title: !1
			}]);
			$("#grid").jqGrid({
				url: a,
				postData: queryConditions,
				datatype: "json",
				autowidth: !0,
				height: 354,
				altRows: !0,
				gridview: !0,
				onselectrow: !1,
				multiselect: !0,
				multiboxonly: !0,
				colModel: b,
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
				loadComplete: function() {
					$("#jqgh_grid_cb").hide()
				},
				loadError: function() {}
			})
		},
		reloadData: function(a) {
			$("#grid").jqGrid("setGridParam", {
				page: 1,
				postData: a
			}).trigger("reloadGrid")
		},
		addEvent: function() {
			var a = this;
			$(".grid-wrap").on("click", ".ui-icon-search", function(a) {
				a.preventDefault();
				var b = $(this).parent().data("id");
				Business.forSearch(b, "")
			}), $("#search").click(function() {
				var b = "輸入編號/名稱/聯絡人/電話" === a.$_matchCon.val() ? "" : a.$_matchCon.val(),
					c = a.catorageCombo.getValue();
				a.reloadData({
					skey: b,
					categoryId: c
				})
			}), $("#refresh").click(function() {
				a.reloadData(queryConditions)
			})
		}
	};
THISPAGE.init();