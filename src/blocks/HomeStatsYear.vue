<template>
  <fi-block 
    theme="dark"
    class="block-home-stats-year"
    :title="$t('home.stats_year._title')"
    >
    <b-container class="stats-year-container">
      <b-row>
        FIXME: Années
      </b-row>
      <b-row>
        FIXME: Histogrammes
      </b-row>
      <b-row>
        FIXME: Légende
      </b-row>
    </b-container>
  </fi-block>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator';
import FiBlock from '@/components/Block.vue';

@Component({
  data: () => {
    return {
      counter: 106
    }
  },
  components: {
    FiBlock
  },
})

export default class FiHomeStatsYear extends Vue {}

</script>

<style lang="scss" scoped>
@import "@/styles/_base.scss";

.block-home-stats-year {
  @include blockblood;
}
</style>



