<template>
  <fi-block theme="dark" class="block-home-header">
    <div class="container">
      <div class="intro-text">
        <span class="intro-lead-in">{{ $t('home.header.since_1st_jan') }}</span>
        <span class="intro-heading">{{ counter }}</span>
        <span class="intro-lead-out">{{ $tc('home.header.women', counter) }}</span>
        <span class="intro-subtitle">{{ $tc('home.header.were_assassinated', counter) }}</span>
        <span class="intro-description">{{ $tc('home.header.by_their_husbands', counter) }}</span>
      </div>
    </div>
  </fi-block>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
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

export default class FiHomeHeader extends Vue {}

</script>

<style lang="scss" scoped>
@import "@/styles/_base.scss";

.block-home-header {
  text-align: center;

  .container {
    height: 100%;
  }

  .intro-text {
    display: flex;
    flex-direction: column;
    justify-content: center;
    height: 100%;
    padding-top: 40px;
    padding-bottom: 50px;

    .intro-lead-in {
      display: block;
      margin-bottom: .5rem;
      font-family:  $fontPrimary;
      font-size: 2.0rem;
      font-weight: bold;
      color:  inherit;
      line-height: 1.25;
    }

    .intro-heading {
      margin-bottom: 0rem;
      display: block;
      font-family:  $fontPrimary;
      font-size: 16rem;
      font-weight: bolder;
      line-height: 1.25;
      color:  inherit;
    }

    .intro-lead-out {
      display: block;
      margin-top: -3rem;
      margin-bottom: 0rem;
      font-family:  $fontPrimary;
      font-weight: bolder;
      font-size: 6rem;
      color:  inherit;
      line-height: 1.35;
    }

    .intro-subtitle {
      margin-bottom: 0rem;
      font-family:  $fontPrimary;
      font-weight: bolder;
      font-size: 2.2rem;
      color:  inherit;
      line-height: 1.35;
    }

    .intro-description {
      margin-bottom: 2rem;
      font-family:  $fontPrimary;
      font-size: 2.2rem;
      color:  inherit;
      line-height: 1.35;
    }

    .btn {
      overflow: hidden;
    }
  }

  max-height: 90vh;
}
</style>



