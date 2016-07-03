<?php $this->load->view('header');?>

<script type="text/javascript">
var DOMAIN = document.domain;
var WDURL = "";
var SCHEME= "<?php echo sys_skin()?>";
try{
	document.domain = '<?php echo base_url()?>';
}catch(e){
}
</script>

<style>
#matchCon { width: 240px; }
</style>
</head>

<body style="background: #FFF;">
<div class="container" style="margin:20px 20px 0; width:760px; ">
  <div class="grid-wrap">
    <table id="grid">
    </table>
    <div id="page"></div>
  </div>
</div>
<script>
$("#grid").jqGrid({
	url:'../basedata/inventory/listInventoryQtyWarning?action=listInventoryQtyWarning',
	datatype: "json",
	autowidth: true,
	height: 310,
	gridview: true,
	colModel:[
		{name: 'number', label: '商品編碼', width: 60, title: false},
    	{name: 'name', label: '商品名稱', width: 160, classes: 'ui-ellipsis'},
    	{name: 'spec', label: '規格型號', width: 60, classes: 'ui-ellipsis'},
    	{name: 'unitName', label: '單位', width: 40, align: 'center', title: false},
    	{name: 'lowQty', label: '最低庫存', width: 40, align: 'center', title: false},
    	{name: 'highQty', label: '最高庫存', width: 40, align: 'center', title: false},
    	{name: 'qty', label: '結存數量', width: 40, align: 'center', title: false},
    	{name: 'warning', label: '超限數量', width: 40, align: 'center', title: false}
    	
	],
	cmTemplate: {sortable: false},
	page: 1, 
	sortname: 'number',    
	sortorder: "desc", 
	pager: "#page",  
	rowNum: 2000,
	rowList:[300,500,1000],     
	scroll: 1,
	loadonce: true,
	viewrecords: true,
	shrinkToFit: true,
	forceFit: false,
	jsonReader: {
	  root: "data.rows", 
	  records: "data.total",  
	  repeatitems : false,
	  id: 0
	}
});
</script>
</body>
</html>