/*
* jPushApplication.js
* name:xiaojia 小嘉
* email:iatt@qq.com
* qq:273142650
* time:2012.4.1 10:32 愚人节~
*/

var jPushApplication = {

	debug: false,

	data: {

		nowApp: null,

		applicationlist: null

	},

	refresh: function () {

		this.data.applicationlist = null;

	},

	setApp: function (app, ul) {

		app = $(app);

		var dom, screen;

		var id = 'application_' + app.attr('id') + '_list';

		dom = $('<li class="app-main-li" id="' + id + '" title="' + app.attr('name') + '"><div class="ico"><img src="' + app.attr('ico') + '"/></div><div class="tit-bg"></div><div class="tit-tx">' + app.attr('name') + '</div><div class="transparent"></div></li>').appendTo(ul);

		jQuery.jSwap.load(ul, dom);

		jPushApplication.bind(dom, app);

	},

	moreApp: function (ul) {

		var lang = jPushDefaultLanguage;

		var dom = $('<li class="app-main-li more-app"><div class="ico"><img src="template/default/style/images/more-app.png"/></div><div class="tit-bg"></div><div class="tit-tx">' + lang.moreApp + '</div><div class="transparent"></div></li>').appendTo(ul);

		dom.on('click', function () {

			jPushInit.applicationCenter();

		});

	},

	getAppList: function () {

		var appXml;

		var ul;

		var _this = this;

		appXml = this.getAppXml();

		appXml.find('screen').each(

			function () {

				ul = $('<ul style="display:none;"></ul>').appendTo('#app-main');

				$(this).find('applist app').each(

					function () {

						_this.setApp(this, ul);

					}

				);

				_this.moreApp(ul);

			}

		);

		appXml.find('shortcut app').each(

			function () {

				var dom;

				var app = $(this);

				dom = $('<li class="app-menu-li" id="application_' + app.attr('id') + '_list" title="' + app.attr('name') + '"><div class="app-menu-ico"><img src="' + app.attr('ico') + '"/></div><div class="transparent"></div></li>').appendTo('#menu-left .app-list ul:eq(0)');

				jPushApplication.bind(dom, app, 1);

			}

		);

	},

	contextmenu: function () {

		var _this = this;

		var lang = jPushDefaultLanguage;

		jQuery.jContextmenu.load(document.body, 'contextmenu', [

			[lang.contextmenu.ShowDesktop, function () {

				var domList = jQuery.jLayer.domList;

				for (var val in domList) {

					$('#' + val).hide();

				}

			} ],

			[lang.contextmenu.dictionary, function () {

				location.href = jPushTemplate.getFilePages().find('plugin add:[key=dictionary]').attr('value'); ;

			}, '|'],

			[lang.theme, function () {

				$('.oper-list .o4').click();

			}, '|'],

			[lang.operation, function () {

				$('.oper-list .o3').click();

			} ],

			[lang.applicationcenter, function () {

				jPushInit.screenMenuSet();

			} ],

			[lang.contextmenu.process, function () {

				var layerData = {

					id: 'jPush_SystemProcess',

					title: lang.contextmenu.process,

					MenuData: {

						name: lang.contextmenu.process,

						icon: jPushTemplate.getConfig().find('add:[key=SystemIcon]').attr('value')

					},

					width: '430px',

					height: '570px',

					minWidth: 430,

					minHeight: 570

				};

				var url = jPushTemplate.getFilePages().find('plugin add:[key=process]').attr('value');

				jPushApplication.getLayer(layerData, url);

			}, '|'],

			[lang.logout, function () {

				$.get(jPush.data.Config.logout, function () {

					location.reload();

				});

			} ],

			[lang.about, function () {

				window.open('http://32100.net/');

			}, '|']

		]);

		$(document).bind('click',

			function () {

				jQuery.jContextmenu.close(0);

			}

		);

	},

	moveApp: function (dom, screen) {

		$(dom).insertBefore($('#app-main ul').eq(--screen).find('.more-app'));

	},

	bind: function (dom, app, type) {

		var _this = this;

		var state = jPushUser.userState();

		if (type != 1) {
	
			jQuery.jContextmenu.load(dom, 'contextmenu', [
	
				[jPushDefaultLanguage.contextmenu.open, function () {
	
					dom.click();
	
				} ],
	
				[jPushDefaultLanguage.contextmenu.move, [
	
					[jPushDefaultLanguage.contextmenu.screen1, function () {
	
						_this.moveApp(dom, 1);
	
					} ],
	
					[jPushDefaultLanguage.contextmenu.screen2, function () {
	
						_this.moveApp(dom, 2);
	
					} ],
	
					[jPushDefaultLanguage.contextmenu.screen3, function () {
	
						_this.moveApp(dom, 3);
	
					} ],
	
					[jPushDefaultLanguage.contextmenu.screen4, function () {
	
						_this.moveApp(dom, 4);
	
					} ],
	
					[jPushDefaultLanguage.contextmenu.screen5, function () {
	
						_this.moveApp(dom, 5);
	
					} ]
	
				]],
	
				[jPushDefaultLanguage.contextmenu.uninstall, function () {
	
					dom.remove();
	
				} ]
	
			]);
			
		}

		dom.bind('click',

			function () {

				var verify = app.attr('verify');

				if (state != 200 && verify == 0) {

					jPushInit.login();

				} else {

					var id = 'application_' + app.attr('id');

					var _this = $(this);

					$.ajax({

						type: 'GET',

						url: app.attr('config'),

						cache: !this.debug,

						dataType: 'xml',

						success: function (xmlHttp) {

							var iframe, parent, url, layerData, key;

							xmlHttp = $(xmlHttp).find('applicationConfig');

							url = xmlHttp.find('add:[key=src]').attr('value');

							var hash = url.match(/#.*/ig);

							url = url.replace(/#.*/ig, '');

							if (url.search(/\?/ig) != -1) {

								url += '&layerID=' + id;

							} else {

								url += '?layerID=' + id;

							}

							url += hash;

							layerData = {

								title: app.attr('name'),

								id: id,

								MenuData: {

									name: app.attr('name'),

									icon: app.attr('ico')

								}

							}

							xmlHttp.find('add').each(

								function () {

									key = $(this).attr('key');

									if (key != 'src') {

										layerData[key] = $(this).attr('value');

									}

								}

							);

							jPushApplication.getLayer(layerData, url);

						}

					});

				}

			}

		);

	},

	getLayer: function (json, url, callback) {

		json.subject = '<div class="loading"></div>';

		json['close'] = function () {

			jPushApplication.menu();

			jPushApplication.hash('');

		}

		json['drag'] = function () {

			jPushApplication.menu(json.id);

		}

		var box = $.jLayer.layer(json);

		var body = box.find('.jqe-ui-jLayer-layer-body');

		var success = function () {

			box.find('.jqe-ui-jLayer-layer-body .loading').fadeOut(500, function () {

				$(this).remove();

			});

		}

		if (typeof callback != 'undefined') {

			$.get(url, function (xmlHttp) {

				$(xmlHttp).appendTo(body);

				callback();

				success();

			});

		} else {

			var iframe = $('<iframe frameborder="0" allowtransparency="true" width="100%" height="100%" src="' + url + '"></iframe>').appendTo(body);

			iframe.load(success);

		}

		jPushApplication.hash(json.id + '_list');

		jPushApplication.menu(json.id);

	},

	menu: function (id) {

		var dom, style;

		var menu = $('#menu-bottom ul');

		var domList = jQuery.jLayer.domList;

		menu.html('');

		for (var val in domList) {

			dom = $('#' + val + '_list');

			if (val == id) {

				style = 'cur';

				this.data.nowApp = val;

			} else {

				style = 'nor';

			}

			app = $('<li class="' + style + '" title="' + domList[val].config.MenuData.name + '"><div class="big"><img src="' + domList[val].config.MenuData.icon + '" /></div><div class="tit">' + domList[val].config.MenuData.name + '</div><div class="transparent"></div></li>').appendTo(menu);

			jPushInit.menuBottomMouse(app, val);

		}

	},

	hash: function (value) {

		if (typeof value == 'undefined') {

			return top.location.hash;

		} else {

			top.location.hash = value;

		}

	},

	appScreen: function (app) {

		return $('#app-main ul').index(app.parent());

	},

	getAppXml: function () {

		var _applicationlist;

		if (this.data.applicationlist != null) {

			return this.data.applicationlist;

		} else {

			$.ajax({

				type: 'GET',

				url: jPushUser.userinfo().find('add:[key=applicationList]').attr('value'),

				async: false,

				cache: false,

				dataType: 'xml',

				success: function (xmlHttp) {

					_applicationlist = $(xmlHttp);

				}

			});

			this.data.applicationlist = _applicationlist;

			return this.data.applicationlist;

		}

	}

}