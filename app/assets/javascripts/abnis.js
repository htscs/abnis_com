/* 
JavaScript Document. I'm using the Jquery library 
*/

/* NEW POPUP WINDOW START */

	$('a.newWindow').click(function(){newWindows('./login.html');});

	function newWindows($path){
		//alert ("hello "+$path);
		// window.open ($path,'','status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scrollbars=0,width=330,height=490'); /*leaving the second attribute empty '' you have popup windows without name. This means multiple session of popup windows without centralized control*/
		
/* ! DEBUG */ window.open ($path);
		
		return false;
	}

/* NEW POPUP WINDOW END */


/* OVERLAY BASE CODE START - make all links with the 'rel' attribute open overlays /**/

	// Comando per CONSOLE di FIREBUG: console.dir($("a[rel]").data("overlay"));

	$("a[loadOverlay=false][rel]").overlay({
		fixed: false		
		,top: 30
		,mask: { /* some mask tweaks suitable for modal dialogs */
			color: '#ebecff'
			,loadSpeed: 200
			,opacity: 0.9	
		}
		,load: false
	});

		
	$("a[loadOverlay=true][rel]").overlay({
		fixed: false		
		,top: 30
		,mask: { /* some mask tweaks suitable for modal dialogs */
			color: '#ebecff'
			,loadSpeed: 200
			,opacity: 0.9	
		}
		,load: true
		/*
		,onBeforeLoad: function(event) {
			alert ($(this).attr("class"));
			
			if ($("a[rel]").attr("class") == "icoPerson"){
				alert ("bello");
			} else {
				alert ("brutto");
			}
			
		}
		*/
	});

/* OVERLAY BASE CODE END */


/* TABS start */

	$("ul.css-tabs").tabs("div.css-panes > div", {
		initialIndex:0 /*the first tab is number 0*/
	});

/* TABS end */


/* IPHONE CHECKBOXES start */

	$('.css_sized_container :checkbox').iphoneStyle({ 
		resizeContainer: true
		, resizeHandle: false
		, checkedLabel: 'attuale'
		, uncheckedLabel: 'archivio' 
	});

/* IPHONE CHECKBOXES end */


	$('a.fire-css-tabs').click(function(){
		alert ("hello");
	});

	$('button').click(function(){
		alert ("submit");
	});
/*
	$('div#button1').click(function(){h1Yellow('0');});

	function h1Yellow($num) {
		$('h1:eq(' + parseInt($num) + ')').toggleClass('highlightYellow');
	}
	
*/
