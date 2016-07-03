var queryConditions={skey:""},SYSTEM=parent.SYSTEM;
var qtyPlaces=Number(parent.SYSTEM.qtyPlaces),pricePlaces=Number(parent.SYSTEM.pricePlaces),amountPlaces=Number(parent.SYSTEM.amountPlaces);
var THISPAGE={
	init:function(a){
		this.api=frameElement.api;
		this.data=this.api.data;
		this.initDom();
		this.loadGrid();
		this.addEvent();
	},
	initDom:function(){
		this.$_matchCon=$("#matchCon");
		this.$_beginDate=$("#beginDate").val(SYSTEM.beginDate);
		this.$_endDate=$("#endDate").val(SYSTEM.endDate);
		this.$_matchCon.placeholder();
		this.$_beginDate.datepicker();
		this.$_endDate.datepicker();
	},
	loadGrid:function(){
		var c=this.data.url;
		var a=$(window).height()-$(".grid-wrap").offset().top-84;
		queryConditions.beginDate=this.$_beginDate.val();
		queryConditions.endDate=this.$_endDate.val();
		$("#grid").jqGrid({
			url:c,
			postData:queryConditions,
			datatype:"json",
			width:724,
			height:354,
			altRows:true,
			colModel:[{
				name:"billId",
				label:"ID",
				width:0,
				hidden:true
			},{
				name:"billType",
				width:0,
				hidden:true
			},{
				name:"billNo",
				label:"源单编号",
				width:120,
				classes:"ui-ellipsis",
				formatter:b
			},{
				name:"transType",
				label:"业务类别",
				width:80,
				align:"center"
			},{
				name:"billDate",
				label:"单据日期",
				width:70,
				align:"center"
			},{
				name:"billPrice",
				label:"单据金额",
				width:100,
				align:"right",
				formatter:"currency",
				formatoptions:{
					showZero:true,
					decimalPlaces:amountPlaces
				}
			},{
				name:"hasCheck",
				label:"已核销金额",
				width:100,
				align:"right",
				formatter:"currency",
				formatoptions:{
					showZero:true,
					decimalPlaces:amountPlaces
				}
			},{
				name:"notCheck",
				label:"未核销金额",
				width:100,
				align:"right",
				formatter:"currency",
				formatoptions:{
					showZero:true,
					decimalPlaces:amountPlaces
				}
			},{
				name:"desc",
				label:"备注",
				width:150,
				classes:"ui-ellipsis"
			}],
			cmTemplate:{
				sortable:false,
				title:false
			},
			multiselect:true,
			page:1,
			sortname:"number",
			sortorder:"desc",
			pager:"#page",
			rowNum:2000,
			rowList:[300,500,1000],
			scroll:1,
			loadonce:true,
			viewrecords:true,
			shrinkToFit:false,
			forceFit:false,
			jsonReader:{
				root:"data.items",
				records:"data.totalsize",
				repeatitems:false,
				id:"billId"
			},
			loadError:function(f,d,e){}});
				
				function b(g,d,f){
					if(g){
						if(g.indexOf("XS")>=0||g.indexOf("CG")>=0||g.indexOf("SK")>=0||g.indexOf("FK")>=0){
							var e='<span class="sourceOrderLink">'+g+"</span>";
						}
						else{var e=g;}
						return e;
					}
					else{return"";}
					}},
				reloadData:function(b){
					var a=this.data.url;
					$("#grid").jqGrid("setGridParam",{
						url:a,
						datatype:"json",
						postData:b
					}).trigger("reloadGrid");
					},addEvent:function(){
						var a=this;
						$("#search").click(function(){
							var b=$("#beginDate").val(),c=$("#endDate").val();
							if(b&&c&&new Date(b).getTime()>new Date(c).getTime()){
								parent.Public.tips({
									type:1,
									content:"开始日期不能大于结束日期"
								});
								return;
							}
							queryConditions.beginDate=b;
							queryConditions.endDate=c;
							queryConditions.billNo=a.$_matchCon.val()==="请输入源单编号"?"":a.$_matchCon.val();
							THISPAGE.reloadData(queryConditions);
						});
						$("#refresh").click(function(){
							THISPAGE.reloadData(queryConditions);
						});
						$(".grid-wrap").on("click",'.sourceOrderLink:contains("XS")',function(d){
							d.preventDefault();
							var b=$(this).closest("tr")[0].id;
							var f=$("#grid").jqGrid("getRowData",b);
							var c=f.disEditable==1?"&disEditable=true":"";
							parent.parent.tab.addTabItem({
								tabid:"sales-sales",
								text:"出貨單",
								//url:"/sales/sales.jsp?id="+f.billId+"&flag=list"+c
								url:"../scm/invSa?action=editSale&id="+f.billId+"&flag=list"+c
							});
						});
						$(".grid-wrap").on("click",'.sourceOrderLink:contains("CG")',function(d){
							d.preventDefault();
							var b=$(this).closest("tr")[0].id;
							var f=$("#grid").jqGrid("getRowData",b);
							var c=f.disEditable==1?"&disEditable=true":"";parent.parent.tab.addTabItem({
								tabid:"purchase-purchase",
								text:"入貨單",
								//url:"/purchase/purchase.jsp?id="+f.billId+"&flag=list"+c
								url:"../scm/invPu?action=editPur&id="+f.billId+"&flag=list"+c
							});
						});
						$(".grid-wrap").on("click",'.sourceOrderLink:contains("SK")',function(d){
							d.preventDefault();
							var b=$(this).closest("tr")[0].id;
							var f=$("#grid").jqGrid("getRowData",b);
							var c=f.disEditable==1?"&disEditable=true":"";
							parent.parent.tab.addTabItem({
								tabid:"money-receipt",
								text:"收款单",
								url:"/scm/receipt.do?action=initReceipt&id="+f.billId+"&flag=list"+c
							});
						});
						$(".grid-wrap").on("click",'.sourceOrderLink:contains("FK")',function(d){
							d.preventDefault();
							var b=$(this).closest("tr")[0].id;
							var f=$("#grid").jqGrid("getRowData",b);
							var c=f.disEditable==1?"&disEditable=true":"";
							parent.parent.tab.addTabItem({
								tabid:"money-payment",
								text:"付款单",
								url:"/scm/payment.do?action=initPay&id="+f.billId+"&flag=list"+c
							});
						});
					}};
					THISPAGE.init();