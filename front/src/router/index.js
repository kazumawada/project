import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import { authGuard } from "../auth/authGuard";

Vue.use(VueRouter)

// const routes = [
// ]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes:[
    {
      path: "/profile",
      name: "profile",
      beforeEnter: authGuard
    },
     {
    path: '/smoothLogin',
    name: 'SmoothLogin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/SmoothLogin.vue')
  },
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/playground',
    name: 'Playground',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Playground.vue')
  },
  {
    path: '/playGround02',
    name: 'playGround02',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/playGround02.vue')
  },
  {
    path: '/login',
    name: 'Login',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Login.vue')
  },
  {
    path: '/post',
    name: 'Post',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Post.vue')
  },
  ]
})

export default router
