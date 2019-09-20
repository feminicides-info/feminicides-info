<template>
  <fi-block theme="light" 
            class="block-home-meaning"
            :title="$t('home.meaning._title')" >
    <b-container class="meaning-container">
      <b-row>
        <b-col cols="12" sm="4" md="3">
          <h3>{{ $t('home.meaning.this_year') }}</h3>
        </b-col>
        <b-col cols="12" sm="8" md="9">
          <b-progress :max="100" class="meaning-progress">
            <b-progress-bar
              :value="100"
              show-label
              label="FIXME: 106 féminicides"
              class="meaning-progress-bar highlight">
            </b-progress-bar>
          </b-progress>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="12" sm="4" md="3" >
          <h3>{{ $t('home.meaning.previous_year') }}</h3>
        </b-col>
        <b-col cols="12" sm="8" md="9">
          <b-progress :max="100" class="meaning-progress">
            <b-progress-bar
              :value="80"
              show-label
              label="FIXME: 97 féminicides"
              class="meaning-progress-bar"
              >
            </b-progress-bar>
          </b-progress>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="12">
          <p>{{ $t('home.meaning.on_the_period',  { date: $d( new Date(), 'short_no_year') }) }}</p>
          <p v-html="$t('home.meaning.if_projected',  { estimation_current_year_counter }) + ' ' + $t('home.meaning.projected_' + more_same_less, { estimation_difference_counter })">
          </p>
          <p v-html="$t('home.meaning.thus_a_woman_dies',  { rythm_counter })"></p>
        </b-col>
      </b-row>
    </b-container>
  </fi-block>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator';
import FiBlock from '@/components/Block.vue';

@Component({
  components: {
    FiBlock
  },
})

export default class FiHomeMeaning extends Vue {
  counter : number = 106
  estimation_current_year_counter : number = 140
  estimation_difference_counter : number = 20
  rythm_counter : number = 2

  get more_same_less() {
    if (this.estimation_difference_counter > 0) {
      return "more"
    } else if (this.estimation_difference_counter < 0) {
      return "less"
    } else {
      return "same"
    }
  }

  get today() {
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

  .meaning-progress {
    height: 2.5rem;
    margin-bottom: 1rem;

    .meaning-progress-bar {
      height: 2.5rem;
      border: 1px solid black;
      background-color: $colorWhite;
      color: $colorBlack;
      text-align: left;
      font-weight: bold;
      font-size: $fontSizeNormal;
      padding-left: .5rem;

      &.highlight {
        border: 1px solid $colorRed;
        background-color: $colorRed;
      }
    }
  }
}
</style>



