<template>
  <div id="page-home">
    <fi-header-home />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HeaderHome from '@/blocks/HeaderHome.vue';

@Component({
  components: {
    'fi-header-home': HeaderHome,
  },
})
export default class Home extends Vue {}
</script>

<style>
</style>
