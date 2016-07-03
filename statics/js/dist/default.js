function setTabHeight() {
	var a = $(window).height(),
		b = $("#main-bd"),
		c = a - b.offset().top;
	b.height(c)
}
function initDate() {
	var a = new Date,
		b = a.getFullYear(),
		c = ("0" + (a.getMonth() + 1)).slice(-2),
		d = ("0" + a.getDate()).slice(-2);
	SYSTEM.beginDate = b + "-" + c + "-01", SYSTEM.endDate = b + "-" + c + "-" + d
}
function addUrlParam() {
	var a = "beginDate=" + SYSTEM.beginDate + "&endDate=" + SYSTEM.endDate;
	$("#nav").find("li.item-report .nav-item a").each(function() {
		var b = this.href;
		b += -1 === this.href.lastIndexOf("?") ? "?" : "&", this.href = "商品庫存餘額表" === $(this).html() ? b + "beginDate=" + SYSTEM.startDate + "&endDate=" + SYSTEM.endDate : b + a
	})
}
function BBSPop() {

}
function getStores() {

}
function getLogistics() {

}
function setCurrentNav(a) {
	if (a) {
		var b = a.match(/([a-zA-Z]+)[-]?/)[1];
		$("#nav > li").removeClass("current"), $("#nav > li.item-" + b).addClass("current")
	}
}
var dataReflush, list = {
	
	purchase: {
		name: "採購入貨",
		href: "../scm/invPu?action=initPur",
		dataRight: "PU_ADD",
		target: "purchase",
		list: "../scm/invPu?action=initPurList"
	},
	purchaseBack: {
		name: "採購退貨",
		href: "../scm/invPu?action=initPur&transType=150502",
		dataRight: "PU_ADD",
		target: "purchase",
		list: "../scm/invPu?action=initPurList&transType=150502"
	},
	sales: {
		name: "銷售出貨",
		href: "../scm/invSa?action=initSale",
		dataRight: "SA_ADD",
		target: "sales",
		list: "../scm/invSa?action=initSaleList"
	},
	salesBack: {
		name: "銷售退貨",
		href: "../scm/invSa?action=initSale&transType=150602",
		dataRight: "SA_ADD",
		target: "sales",
		list: "../scm/invSa?action=initSaleList&transType=150602"
	},

	inventory: {
		name: "盤點",
		href: "../storage/inventory",
		dataRight: "PD_GENPD",
		target: "storage"
	},
	otherWarehouse: {
		name: "其他入庫",
		href: "../scm/invOi?action=initOi&type=in",
		dataRight: "IO_ADD",
		target: "storage",
		list: "../scm/invOi?action=initOiList&type=in"
	},
	otherOutbound: {
		name: "其他出庫",
		href: "../scm/invOi?action=initOi&type=out",
		dataRight: "OO_ADD",
		target: "storage",
		list: "../scm/invOi?action=initOiList&type=out"
	},
	adjustment: {
		name: "成本調整",
		href: "../scm/invOi?action=initOi&type=cbtz",
		dataRight: "CADJ_ADD",
		target: "storage",
		list: "../scm/invOi?action=initOiList&type=cbtz"
	},

	receipt: {
		name: "收款單",
		href: "../scm/receipt?action=initReceipt",
		dataRight: "RECEIPT_ADD",
		target: "money",
		list: "../scm/receipt?action=initReceiptList"
	},
	payment: {
		name: "付款單",
		href: "../scm/payment?action=initPay",
		dataRight: "PAYMENT_ADD",
		target: "money",
		list: "../scm/payment?action=initPayList"
	},

	otherIncome: {
		name: "其他收入單",
		href: "../scm/ori?action=initInc",
		dataRight: "QTSR_ADD",
		target: "money",
		list: "../scm/ori?action=initIncList"
	},
	otherExpense: {
		name: "其他支出單",
		href: "../scm/ori?action=initExp",
		dataRight: "QTZC_ADD",
		target: "money",
		list: "../scm/ori?action=initExpList"
	},

	puDetail: {
		name: "採購明細表",
		href: "../report/pu_detail_new",
		dataRight: "PUREOORTDETAIL_QUERY",
		target: "report-purchase"
	},

    puSummary: {
		name: "採購匯總表（按商品）",
		href: "../report/pu_summary_new",
		dataRight: "PUREPORTINV_QUERY",
		target: "report-purchase"
	},

    
	puSummarySupply: {
		name: "採購匯總表（按供應商）",
		href: "../report/pu_summary_supply_new",
		dataRight: "PUREPORTPUR_QUERY",
		target: "report-purchase"
	},

	salesDetail: {
		name: "銷售明細表",
		href: "../report/sales_detail",
		dataRight: "SAREPORTDETAIL_QUERY",
		target: "report-sales"
	},
	salesSummary: {
		name: "銷售匯總表（按商品）",
		href: "../report/sales_summary",
		dataRight: "SAREPORTINV_QUERY",
		target: "report-sales"
	},
	
	salesSummaryCustomer: {
		name: "銷售匯總表（按客戶）",
		href: "../report/sales_summary_customer_new",
		dataRight: "SAREPORTBU_QUERY",
		target: "report-sales"
	},

	contactDebt: {
		name: "來往單位欠款表",
		href: "../report/contact_debt_new",
		dataRight: "ContactDebtReport_QUERY",
		target: "report-money"
	},
	initialBalance: {
		name: "庫存餘額表",
		href: "../report/goods_balance",
		dataRight: "InvBalanceReport_QUERY",
		target: "report-storage"
	},
	goodsFlowDetail: {
		name: "倉庫進出明細表",
		href: "../report/goods_flow_detail",
		dataRight: "DeliverDetailReport_QUERY",
		target: "report-storage"
	},
	goodsFlowSummary: {
		name: "倉庫進出匯總表",
		href: "../report/goods_flow_summary",
		dataRight: "DeliverSummaryReport_QUERY",
		target: "report-storage"
	},

	cashBankJournal: {
		name: "現金銀行報表",
		href: "../report/cash_bank_journal_new",
		dataRight: "SettAcctReport_QUERY",
		target: "report-money"
	},
	accountPayDetail: {
		name: "應付賬款明細表",
		href: "../report/account_pay_detail_new?action=detailSupplier&type=10",
		dataRight: "PAYMENTDETAIL_QUERY",
		target: "report-money"
	},
	accountProceedsDetail: {
		name: "應收賬款明細表",
		href: "../report/account_proceeds_detail_new?action=detail",
		dataRight: "RECEIPTDETAIL_QUERY",
		target: "report-money"
	},	
	otherIncomeExpenseDetail: {
		name: "其他收支明細表",
		href: "../report/other_income_expense_detail",
		dataRight: "ORIDETAIL_QUERY",
		target: "report-money"
	},
	suppliersReconciliation: {
		name: "供應商對賬單",
		href: "../report/suppliers_reconciliation_new",
		dataRight: "SUPPLIERBALANCE_QUERY",
		target: "report-money"
	},
	customersReconciliation: {
		name: "客戶對賬單",
		href: "../report/customers_reconciliation_new",
		dataRight: "CUSTOMERBALANCE_QUERY",
		target: "report-money"
	},

	customerList: {
		name: "客戶資料",
		href: "../settings/customer_list",
		dataRight: "BU_QUERY",
		target: "setting-base"
	},
	vendorList: {
		name: "供應商資料",
		href: "../settings/vendor_list",
		dataRight: "PUR_QUERY",
		target: "setting-base"
	},
	goodsList: {
		name: "商品資料",
		href: "../settings/goods_list",
		dataRight: "INVENTORY_QUERY",
		target: "setting-base"
	},
	storageList: {
		name: "倉庫管理",
		href: "../settings/storage_list",
		dataRight: "INVLOCTION_QUERY",
		target: "setting-base"
	},
	staffList: {
		name: "職員管理",
		href: "../settings/staff_list",
		dataRight: "",
		target: "setting-base"
	},
	settlementaccount: {
		name: "資金戶口",
		href: "../settings/settlement_account",
		dataRight: "SettAcct_QUERY",
		target: "setting-base"
	},

	customerCategoryList: {
		name: "客戶分類",
		href: "../settings/category_list?typeNumber=customertype",
		dataRight: "BUTYPE_QUERY",
		target: "setting-auxiliary"
	},
	vendorCategoryList: {
		name: "供應商分類",
		href: "../settings/category_list?typeNumber=supplytype",
		dataRight: "SUPPLYTYPE_QUERY",
		target: "setting-auxiliary"
	},
	goodsCategoryList: {
		name: "商品分類",
		href: "../settings/category_list?typeNumber=trade",
		dataRight: "TRADETYPE_QUERY",
		target: "setting-auxiliary"
	},
	
	payCategoryList: {
		name: "支出分類",
		href: "../settings/category_list?typeNumber=paccttype",
		dataRight: "TRADETYPE_QUERY",
		target: "setting-auxiliary"
	},
	recCategoryList: {
		name: "收入分類",
		href: "../settings/category_list?typeNumber=raccttype",
		dataRight: "TRADETYPE_QUERY",
		target: "setting-auxiliary"
	},
	
	unitList: {
		name: "計量單位",
		href: "../settings/unit_list",
		dataRight: "UNIT_QUERY",
		target: "setting-auxiliary"
	},
	settlementCL: {
		name: "結算方式",
		href: "../settings/settlement_category_list",
		dataRight: "Assist_QUERY",
		target: "setting-auxiliary"
	},
	assistingProp: {
		name: "輔助屬性",
		href: "../settings/assistingprop",
		dataRight: "FZSX_QUERY",
		target: "setting-auxiliary"
	},
	parameter: {
		name: "系統參數",
		href: "../settings/system_parameter",
		dataRight: "",
		target: "setting-advancedSetting"
	},
	authority: {
		name: "操作權限",
		href: "../settings/authority",
		dataRight: "",
		target: "setting-advancedSetting"
	},
	operationLog: {
		name: "操作日誌",
		//href: WDURL + "/basedata/log/initloglist",
		href: "../settings/log",
		dataRight: "OPERATE_QUERY",
		target: "setting-advancedSetting"
	},

	backup: {
		name: "備份&恢復",
		href: "../settings/backup",
		dataRight: "",
		target: "setting-advancedSetting"
	},

},
	menu = {
		init: function(a, b) {
			var c = {
				callback: {}
			};
			this.obj = a, this.opts = $.extend(!0, {}, c, b), this.sublist = this.opts.sublist, this.sublist || this._getMenuData(), this._menuControl(), this._initDom(), $(".vip").length || $(".main-nav").css("margin", "5px 0")
		},
		_display: function(a, b) {
			for (var c = a.length - 1; c >= 0; c--) this.sublist[a[c]] && (this.sublist[a[c]].disable = !b);
			return this
		},
		_show: function(a) {
			return this._display(a, !0)
		},
		_hide: function(a) {
			return this._display(a, !1)
		},
		_getMenuData: function() {
			this.sublist = list
		},
		_menuControl: function() {
			var a = SYSTEM.siType,
				b = SYSTEM.isAdmin,
				c = SYSTEM.siVersion;
			switch (this._hide(["authority", "backup", "onlineStoreMap", "onlineStoreList", "onlineStoreRelation", "logisticsList", "orderHandle1", "orderHandle2", "orderHandle3", "orderList", "onlineSalesList", "JDStorageList", "JDStorageGoodsList", "JDStoragePurchaseOrderList", "JDStorageSaleOrderList", "JDStorageInvManage", "assistingProp", "serNumStatus", "serNumTracer"]), a) {
			//switch (this._hide(["authority", "reInitial", "backup", "onlineStoreMap", "onlineStoreList", "onlineStoreRelation", "logisticsList", "orderHandle1", "orderHandle2", "orderHandle3", "orderList", "onlineSalesList", "JDStorageList", "JDStorageGoodsList", "JDStoragePurchaseOrderList", "JDStorageSaleOrderList", "JDStorageInvManage", "assistingProp", "serNumStatus", "serNumTracer"]), a) {
			case 1:
				this._hide(["purchaseOrder", "purchaseOrderList", "salesOrder", "salesOrderList", "verification", "verificationList", "shippingAddress", "puOrderTracking", "salesOrderTracking", "assemble", "disassemble", "serNumStatus", "serNumTracer"]);
				break;
			case 2:
			}
			switch (c) {
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				this._hide(["backup"])
			}
			b && (3 == c && this._show(["reInitial"]), this._show(["authority"]), this._show(["backup"])), 2 == a && (1 == SYSTEM.hasOnlineStore ? this._show(["onlineStoreMap", "onlineStoreList", "onlineStoreRelation", "logisticsList", "orderHandle1", "orderHandle2", "orderHandle3", "orderList", "onlineSalesList"]) : 1 == SYSTEM.enableStorage && $(".vip-nav").width(125), 1 == SYSTEM.enableStorage ? this._show(["JDStorageList", "JDStorageGoodsList", "JDStoragePurchaseOrderList", "JDStorageSaleOrderList", "JDStorageInvManage"]) : 1 == SYSTEM.hasOnlineStore && $(".vip-nav").width(120), 1 == SYSTEM.enableAssistingProp && this._show(["assistingProp"])), 1 == SYSTEM.ISSERNUM && this._show(["serNumStatus", "serNumTracer"])
		},
		_getDom: function() {
			this.objCopy = this.obj.clone(!0), this.container = this.obj.closest("div")
		},
		_setDom: function() {
			this.obj.remove(), this.container.append(this.objCopy)
		},
		_initDom: function() {
			if (this.sublist && this.obj) {
				this.obj.find("li:not(.item)").remove(), this._getDom();
				var a = this.sublist,
					b = {};
				b.target = {};
				for (var c in a) if (!a[c].disable) {
					var d = a[c],
						e = b.target[d.target],
						f = d.id ? "id=" + d.id : "",
						g = d.id ? "" : "rel=pageTab",
						h = "";
					if (d.list) {
						var i = d.name + "記錄";
						h = "<i " + f + ' tabTxt="' + i + '" tabid="' + d.target.split("-")[0] + "-" + c + 'List" ' + g + ' href="' + d.list + '" data-right="' + d.dataRight.split("_")[0] + '_QUERY">查詢</i>'
					}
					var j = "<li><a " + f + ' tabTxt="' + d.name + '" tabid="' + d.target.split("-")[0] + "-" + c + '" ' + g + ' href="' + d.href + '" data-right="' + d.dataRight + '">' + d.name + h + "</a></li>";
					e ? e.append(j) : (b.target[d.target] = this.objCopy.find("#" + d.target), b.target[d.target] && b.target[d.target].append(j))
				}
				this.objCopy.find("li.item").each(function() {
					var a = $(this);
					a.find("li").length || a.remove(), a.find(".nav-item").each(function() {
						var a = $(this);
						a.find("li").length || (a.hasClass("last") && a.prev().addClass("last"), a.remove())
					})
				}), this._setDom()
			}
		}
	};
$(function() {
	$("#companyName").text(SYSTEM.companyName).prop("title", SYSTEM.companyName)
}), setTabHeight(), $(window).bind("resize", function() {
	setTabHeight()
}), function(a) {
	menu.init(a("#nav")), initDate(), addUrlParam(), BBSPop();
	var b = a("#nav"),
		c = a("#nav > li");
	a.each(c, function() {
		var c = a(this).find(".sub-nav-wrap");
		if (a(this).on("mouseenter", function() {
			b.removeClass("static"), a(this).addClass("on"), c.find("i:eq(0)").closest("li").addClass("on"), c.stop(!0, !0).fadeIn(250)
		}).on("mouseleave", function() {
			b.addClass("static"), a(this).removeClass("on"), c.stop(!0, !0).hide()
		}), 0 != c.length && "auto" == c.css("top") && "auto" == c.css("bottom")) {
			var d = (a(this).outerHeight() - c.outerHeight()) / 2;
			c.css({
				top: d
			})
		}
	}), a(".sub-nav-wrap a").bind("click", function() {
		a(this).parents(".sub-nav-wrap").hide()
	}), a(".sub-nav").each(function() {
		a(this).on("mouseover", "li", function() {
			var b = a(this);
			b.siblings().removeClass("on"), b.addClass("on")
		}).on("mouseleave", "li", function() {
			var b = a(this);
			b.removeClass("on")
		})
	})
}(jQuery), $("#page-tab").ligerTab({
	height: "100%",
	changeHeightOnResize: !0,
	onBeforeAddTabItem: function(a) {
		setCurrentNav(a)
	},
	onAfterAddTabItem: function() {},
	onAfterSelectTabItem: function(a) {
		setCurrentNav(a)
	},
	onBeforeRemoveTabItem: function() {},
	onAfterLeaveTabItem: function(a) {
		switch (a) {
		case "setting-vendorList":
			getSupplier();
			break;
		case "setting-customerList":
			getCustomer();
			break;
		case "setting-storageList":
			getStorage();
			break;
		case "setting-goodsList":
			getGoods();
			break;
		case "setting-settlementaccount":
			getAccounts();
			break;
		case "setting-settlementCL":
			getPayments();
			break;
		case "onlineStore-onlineStoreList":
			break;
		case "onlineStore-logisticsList":
			break;
		case "setting-staffList":
			getStaff()
		}
	},
	onAfterSelectTabItem: function(a) {
		switch (a) {
		case "index":
			dataReflush && dataReflush()
		}
	}
});
var tab = $("#page-tab").ligerGetTabManager();
$("#nav").on("click", "[rel=pageTab]", function(a) {
	a.preventDefault();
	var b = $(this).data("right");
	if (b && !Business.verifyRight(b)) return !1;
	var c = $(this).attr("tabid"),
		d = $(this).attr("href"),
		e = $(this).attr("showClose"),
		f = $(this).attr("tabTxt") || $(this).text().replace(">", ""),
		g = $(this).attr("parentOpen");
	return g ? parent.tab.addTabItem({
		tabid: c,
		text: f,
		url: d,
		showClose: e
	}) : tab.addTabItem({
		tabid: c,
		text: f,
		url: d,
		showClose: e
	}), !1
}), tab.addTabItem({
	tabid: "index",
	text: "HOME",
	url: "../home/main",
	showClose: !1
}), function(a) {
	if (2 === SYSTEM.siVersion && SYSTEM.isOpen) {
		var b, c = location.protocol + "//" + location.host + "/update_info.jsp",
			d = '您的单据分录已经录入达到300条，继续使用选择<a href="#" target="_blank">购买产品</a>或者完善个人信息赠送1000条免费容量。';
		SYSTEM.isshortUser ? SYSTEM.isshortUser && (b = "#" + encodeURIComponent(c) + "&warning=" + encodeURIComponent(d) + "&loginPage=#", a.dialog({
			min: !1,
			max: !1,
			cancle: !1,
			lock: !0,
			width: 450,
			height: 490,
			title: "完善个人信息",
			content: "url:" + b
		})) : (b = "#" + encodeURIComponent(c) + "&warning=" + encodeURIComponent(d), a.dialog({
			min: !1,
			max: !1,
			cancle: !1,
			lock: !0,
			width: 400,
			height: 280,
			title: "完善个人信息",
			content: "url:" + b
		}))
	}
}(jQuery), $(window).load(function() {
	function a() {
		var a;
		switch (SYSTEM.siVersion) {
		case 3:
			a = "1";
			break;
		case 4:
			a = "3";
			break;
		default:
			a = "2"
		}
		$.getJSON("home/Services?callback=?", {
			coid: SYSTEM.DBID,
			loginuserno: SYSTEM.UserName,
			version: a,
			type: "getallunreadcount" + SYSTEM.servicePro
		}, function(a) {
			if (0 != a.count) {
				{
					var b = $("#SysNews a");
					b.attr("href")
				}
				b.append("<span>" + a.count + "</span>"), 0 == a.syscount && b.data("tab", 2)
			}
		})
	}
	markupVension(), a(), $("#skin-" + SYSTEM.skin).addClass("select").append("<i></i>"), $("#sysSkin").powerFloat({
		eventType: "click",
		reverseSharp: !0,
		target: function() {
			return $("#selectSkin")
		},
		position: "5-7"
	}), $("#selectSkin li a").click(function() {
		var a = this.id.split("-")[1];
		Public.ajaxPost("../basedata/systemprofile/changeSysSkin?action=changeSysSkin", {
			skin: a
		}, function(a) {
			200 === a.status && window.location.reload()
		})
	});
	var b = $("#nav .item");
	if ($("#scollUp").click(function() {
		var a = b.filter(":visible");
		a.first().prev().length > 0 && (a.first().prev().show(500), a.last().hide())
	}), $("#scollDown").click(function() {
		var a = b.filter(":visible");
		a.last().next().length > 0 && (a.first().hide(), a.last().next().show(500))
	}), $(".service-tab").click(function() {
		var a = $(this).data("tab");
		tab.addTabItem({
			tabid: "myService",
			text: "服务支持",
			url: "../service",
			callback: function() {
				document.getElementById("myService").contentWindow.openTab(a)
			}
		})
	}), $.cookie("ReloadTips") && (Public.tips({
		content: $.cookie("ReloadTips")
	}), $.cookie("ReloadTips", null)), $("#nav").on("click", "#reInitial", function(a) {
		a.preventDefault(), $.dialog({
			lock: !0,
			width: 430,
			height: 180,
			title: "系统提示",
			content: '<div class="re-initialize"><h3>重新初始化系统将会清空你录入的所有数据，请慎重！</h3><ul><li>系统将删除您新增的所有商品、供应商、客户</li><li>系统将删除您录入的所有单据</li><li>系统将删除您录入的所有初始化数据</li></ul><p><input type="checkbox" id="understand" /><label for="understand">我已清楚了解将产生的后果</label></p><p class="check-confirm">（请先确认并勾选“我已清楚了解将产生的后果”）</p></div>',
			icon: "alert.gif",
			okVal: "重新初始化",
			ok: function() {
				if ($("#understand").is(":checked")) {
					this.close();
					var a = $.dialog.tips("正在重新初始化，请稍候...", 1e3, "loading.gif", !0).show();
					$.ajax({
						type: "GET",
						url: "../service/recover?siId=" + SYSTEM.DBID + "&userName=" + SYSTEM.userName,
						cache: !1,
						async: !0,
						dataType: "json",
						success: function(b) {
							200 === b.status && ($("#container").html(""), a.close(), window.location.href = "../home/index?re-initial=true&serviceType=" + SYSTEM.serviceType)
						},
						error: function(a) {
							Public.tips({
								type: 1,
								content: "操作失败了哦！" + a
							})
						}
					})
				} else $(".check-confirm").css("visibility", "visible");
				return !1
			},
			cancelVal: "放弃",
			cancel: !0
		})
	}), SYSTEM.siExpired) {
		var c = [{
			name: "立即续费",
			focus: !0,
			callback: function() {
				window.open("#" + SYSTEM.DBID)
			}
		}, {
			name: "下次再说"
		}],
			d = ['<div class="ui-dialog-tips">', "<p>谢谢您使用本产品，您的当前服务已经到期，到期3个月后数据将被自动清除，如需继续使用请购买/续费！</p>", '<p style="color:#AAA; font-size:12px;">(续费后请刷新页面或重新登录。)</p>', "</div>"].join("");
		$.dialog({
			width: 400,
			min: !1,
			max: !1,
			title: "系统提示",
			fixed: !0,
			lock: !0,
			button: c,
			resize: !1,
			content: d
		})
	}
});