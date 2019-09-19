
import Vue from 'vue'

import VueRouter from 'vue-router'

import Home from '@/pages/Home.vue'
import Contribute from '@/pages/Contribute.vue'
import Help from '@/pages/Help.vue'

Vue.use(VueRouter)

const titlePrefix = 'Féminicides . Info'

export const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      title: titlePrefix,
      requireAuth: true
    }
  },
  {
    path: '/contribute',
    name: 'contribute',
    component: Contribute,
    meta: {
      title: titlePrefix + ' - Nous soutenir',
      requireAuth: false
    }
  },
  {
    path: '/help',
    name: 'help',
    component: Help,
    meta: {
      title: titlePrefix + ' - Nous soutenir',
      requireAuth: false
    }
  },
];

export let router = new VueRouter({
  routes,
  scrollBehavior (to, from, savedPosition) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve({ x: 0, y: 0 })
      }, 500)
    })
  }
})

