<template>
  <div id="app">
    <fi-navigation />
    <transition name="fade" mode="out-in">
    <router-view></router-view>
    </transition>
    <fi-footer />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import FiNavigation from './components/Navigation.vue';
import FiFooter from './components/Footer.vue';

@Component({
  components: {
    FiNavigation,
    FiFooter,
  },
  mounted() {
 //   console.log("TODO: load data from JSON")
  }
})
export default class App extends Vue {}
</script>

<style lang="scss">
@import "@/styles/_base.scss";

html,
body {
  font-size: 10px;
  line-height: 1.25;
  overflow-x: hidden;
}

#app {
  font-family: $fontPrimary;
  font-size: $fontSizeNormal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.fade-enter-active, 
.fade-leave-active {
  transition: opacity .5s;

}
.fade-enter, 
.fade-leave-to {
  opacity: 0;
}
</style>
