<template>
  <div id="page-home">
    <fi-home-header />
    <fi-home-meaning />
    <fi-home-stats-year />
    <fi-home-stats-country />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HomeHeader from '@/blocks/HomeHeader.vue';
import HomeMeaning from '@/blocks/HomeMeaning.vue';
import HomeStatsYear from '@/blocks/HomeStatsYear.vue';
import HomeStatsCountry from '@/blocks/HomeStatsCountry.vue';

@Component({
  components: {
    'fi-home-header': HomeHeader,
    'fi-home-meaning': HomeMeaning,
    'fi-home-stats-year': HomeStatsYear,
    'fi-home-stats-country': HomeStatsCountry,
  },
})
export default class Home extends Vue {}
</script>

<style>
</style>
