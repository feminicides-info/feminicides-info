import Vue from 'vue'
import App from './App.vue'

// Load I18N
import VueI18n from 'vue-i18n'
import * as i18nData from './lib/i18n/'

// Load Bootstrap
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Load Routes
import { router } from '@/lib/router/'

// Setup plugins
Vue.use(VueI18n)
Vue.use(BootstrapVue)

Vue.config.productionTip = false

// Create VueI18n instance with options
const i18n = new VueI18n({
  locale: 'fr', // set locale
  messages: i18nData.messages, // set locale messages
  dateTimeFormats: i18nData.dateTimeFormats
})

new Vue({
  i18n,
  router,
  render: h => h(App),
}).$mount('#app')

