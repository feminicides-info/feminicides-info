<template>
  <fi-block theme="light" 
            class="block-home-meaning"
            :title="$t('home.meaning.what_does_it_means')" >
    <b-container class="block-home-meaning-container">
      <b-row>
        <b-col cols="12" sm="4" md="3">{{ $t('home.meaning.this_year') }}</b-col>
        <b-col cols="12" sm="8" md="9">
          <b-progress max="100" value="100"></b-progress>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="12" sm="4" md="3" >{{ $t('home.meaning.previous_year') }}</b-col>
        <b-col cols="12" sm="8" md="9">
          <b-progress max="100" value="80"></b-progress>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="12">
          <p>{{ $t('home.meaning.on_the_period',  { date: $d( new Date(), 'short' ) }) }}</p>
        </b-col>
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

export default class FiHomeMeaning extends Vue {
  today() {
    return new Date()
  }

  /*
    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    return event.toLocaleDateString('fr', options);
  */
}

</script>

<style lang="scss" scoped>
@import "@/styles/_base.scss";

.block-home-meaning {
  @include blockblood;

  font-size: $fontSizeNormal;
  color: $colorWhite;
  background-color: $colorBlack;
}
</style>



