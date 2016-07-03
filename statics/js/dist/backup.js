function init() {
	(12 == parent.SYSTEM.serviceType || 16 == parent.SYSTEM.serviceType) && $("#localRecover").hide(), getBackupData(), $("#start-backup").on("click", function(a) {
		a.preventDefault(), Business.verifyRight("BACKUP_ADD") && backupConfirm()
	}), $("#localRecover").on("click", function(a) {
		if (12 !== parent.SYSTEM.serviceType || 16 !== parent.SYSTEM.serviceType) {
			if (a.preventDefault(), !Business.verifyRight("BACKUP_RECOVER")) return;
			recoverLocalBackup()
		}
	}), $("#backup-status").on("click", ".btn-recover", function(a) {
		if (a.preventDefault(), Business.verifyRight("BACKUP_RECOVER")) {
			var b = $(this).parent().data("id");
			recoverConfirm(function() {
				recoverBackup(b)
			})
		}
	}), $("#backup-status").on("click", ".btn-del", function(a) {
		if (a.preventDefault(), Business.verifyRight("BACKUP_DELETE")) {
			var b = $(this).parent().data("id");
			deleteBackupConfirm(b)
		}
	})
}
function getBackupData() {
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "../scm/backup/queryBackupFile?m=queryBackupFile",
		success: function(a) {
			a && a.data && (BACKUP_DATA = a.data.items), BACKUP_DATA.length > 0 ? showBackup() : showNoBackup()
		},
		error: function() {
			parent.Public.tips({
				type: 1,
				content: "讀取用戶備份狀況失敗，請刷新頁面重試！",
				autoClose: !1
			})
		}
	})
}
function showNoBackup() {
	var a = "<h3>提示：</h3><p>目前系統未進行過備份，請立即點擊“開始備份”按鍵，備份系統資料。</p>";
	$("#backup-status").html(a)
}
function showBackup() {
	var a = '<div id="dataGrid"><table id="grid"></table></div>';
	$("#backup-status").html(a), initGrid()
}
function initGrid() {
	var a = [400, 150, 80, 90];
	$("#grid").jqGrid({
		data: BACKUP_DATA,
		datatype: "local",
		height: Public.setGrid().h,
		autowidth: !0,
		shrinkToFit: !1,
		altRows: !0,
		gridview: !0,
		colModel: [{
			name: "operate",
			label: "操作",
			index: "operate",
			width: a[3],
			align: "center",
			title: !1,
			formatter: opeFmatter
		}, {
			name: "createTime",
			label: "備份時間",
			index: "createTime",
			width: a[1],
			align: "center",
			title: !1
		}, {
			name: "filename",
			label: "備份文檔",
			index: "filename",
			width: a[0],
			title: !1
		}, {
			name: "size",
			label: "文檔大小",
			index: "size",
			width: a[2],
			align: "center",
			title: !1,
			formatter: sizeFormatter
		}],
		cmTemplate: {
			sortable: !1
		},
		viewrecords: !0,
		localReader: {
			repeatitems: !1,
			id: "fid"
		}
	})
}
function nameFormatter(a) {
	return a.substr(a.lastIndexOf("/") + 1)
}
function sizeFormatter(a) {
	return a = parseInt(a), a = isNaN(a) ? 0 : a, Math.round(a / 1024) + " KB"
}
function opeFmatter(a, b, c) {
	return '<p data-id="' + c.fid + '" class="operate-wrap operating"><a class="btn-recover ui-icon ui-icon-copy" href="#" title="恢復">恢復</a><a class="btn-download ui-icon ui-icon-arrowthickstop-1-s" href="../scm/backup/download?fid=' + c.fid + '" target="_blank" title="下載">下載</a><a class="btn-del ui-icon ui-icon-trash" href="#" title="刪除">刪除</a></p>'
}
function backupConfirm() {
	var a = ["<p>爲保證備份數據的完整性，<strong>請確保賬套內的所有操作員已登出系統</strong>！</p>", "<p>立即執行備份？</p>"];
	$.dialog({
		title: "開始備份",
		id: "backupDialog",
		width: 300,
		height: 80,
		icon: "confirm.gif",
		fixed: !0,
		lock: !0,
		resize: !1,
		parent: parent || null,
		ok: function() {
			return window.setTimeout(function() {
				doBackup()
			}, 0), !0
		},
		cancel: !0,
		content: a.join("")
	})
}
function doBackup() {
	var a = $.dialog.tips("系統正在備份，此過程需要几分鐘時間，請耐心等候...", 1e3, "loading.gif", !0).show();
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "../scm/backup?m=backup",
		success: function(b) {
			if (a.close(), 200 == b.status) {
				parent.Public.tips({
					content: "備份完畢！"
				}), b = b.data;
				var c = BACKUP_DATA.length;
				BACKUP_DATA.push(b), 0 == c ? showBackup() : ($("#grid").jqGrid("addRowData", b.fid, b, "first"), $("#" + b.fid).addClass("ui-state-add").siblings().removeClass("ui-state-add"))
			} else parent.Public.tips({
				type: 1,
				content: b.msg
			})
		},
		error: function() {
			a.close(), parent.Public.tips({
				type: 1,
				content: "備份失敗！請重試！"
			})
		}
	})
}
function deleteBackupConfirm(a) {
	$.dialog({
		title: "刪除備份",
		width: 200,
		height: 80,
		icon: "confirm.gif",
		fixed: !0,
		lock: !0,
		resize: !1,
		parent: parent || null,
		ok: function() {
			return doDelete(a), !0
		},
		cancel: !0,
		content: "確定刪除此備份？"
	})
}
function doDelete(a) {
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "../scm/backup/deleteBackupFile?m=deleteBackupFile&id=" + a,
		success: function(b) {
			if (200 == b.status) {
				$("#grid").jqGrid("delRowData", a);
				for (var c = 0, d = BACKUP_DATA.length; d > c; c++) {
					var e = BACKUP_DATA[c];
					if (e.fid == a) {
						BACKUP_DATA.splice(c, 1);
						break
					}
				}
				0 == BACKUP_DATA.length && showNoBackup(), parent.Public.tips({
					content: "刪除完畢！"
				})
			} else parent.Public.tips({
				type: 1,
				content: b.msg
			})
		},
		error: function() {
			parent.Public.tips({
				type: 1,
				content: "刪除失敗！"
			})
		}
	})
}
function recoverConfirm(a) {
	var b = ["<p>所有賬套數據將恢復至備份文檔所處之狀態，<strong>恢復后不能撤銷退回</strong>，請謹慎操作。</p>", "<p>爲保證數據的完整恢復，<strong>請確保賬套內的所有操作員已登出系統</strong>！</p>", "<p>立即恢復備份？</p>"];
	$.dialog({
		title: "恢復備份",
		width: 340,
		height: 120,
		icon: "confirm.gif",
		fixed: !0,
		lock: !0,
		resize: !1,
		ok: function() {
			return window.setTimeout(function() {
				a()
			}, 0), !0
		},
		cancel: !0,
		content: b.join("")
	})
}
function recoverBackup(a) {
	var b = $.dialog.tips("系統正在恢復，此過程需要几分鐘時間，請耐心等候...", 1e3, "loading.gif", !0).show();
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "../scm/backup/recover?m=recover&id=" + a,
		success: function(a) {
			b.close(), 200 == a.status ? (parent.window.$.cookie("ReloadTips", "恢復完畢！"), parent.window.location.href = "../user/start?siId=" + parent.SYSTEM.DBID) : parent.Public.tips({
				type: 1,
				content: a.msg
			})
		},
		error: function() {
			b.close(), parent.Public.tips({
				type: 1,
				content: "恢復備份失敗！請重試。"
			})
		}
	})
}
function recoverLocalBackup() {
	$.dialog({
		title: "上載本地備份",
		id: "localBackupDialog",
		width: 460,
		height: 130,
		min: !1,
		max: !1,
		fixed: !0,
		resize: !1,
		lock: !0,
		content: "url:upload-backup.jsp",
		okVal: "上載",
		ok: function() {
			return this.content.doUpload(), !1
		},
		cancel: !0
	})
}
var BACKUP_DATA = [];
init(), $(window).resize(function() {
	Public.resizeGrid()
});