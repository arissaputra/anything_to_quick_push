import Vue from 'vue'
import App from './App.vue'
import jQuery from 'jquery';
window.jQuery = jQuery;
window.$ = jQuery;

Vue.config.productionTip = false
require('expose-loader?$!expose-loader?jQuery!jquery');
new Vue({
  render: h => h(App),
}).$mount('#app')
