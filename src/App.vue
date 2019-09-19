<template>
  <div id="app">
    <fi-navigation />
    <router-view></router-view>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import FiNavigation from './components/Navigation.vue';

@Component({
  components: {
    FiNavigation,
  },
  mounted() {
 //   console.log("TODO: load data from JSON")
  }
})
export default class App extends Vue {}
</script>

<style lang="scss">
@import "@/styles/_base.scss";

html,body {
  font-size: 10px;
  line-height: 1.25;
  overflow-x: hidden;
}

#app {
  font-family: $fontPrimary;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
