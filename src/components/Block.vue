
<template>
  <div 
    :class="{
      'fi-block': true,
      'theme-light': theme === 'light',
      'theme-dark': theme === 'dark'
    }">
    <template v-if="title">
      <h2 class="title">{{ title }}</h2>
      <div v-if="subtitle" class="subtitle">{{ subtitle }}</div>
    </template>
    <slot></slot>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator'

@Component
export default class FiBlock extends Vue {
  @Prop()
  title ?: string

  @Prop()
  subtitle ?: string

  @Prop({ default: "light" })
  theme ?: string
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "@/styles/_base.scss";

.fi-block {
  @include blockblood;
  text-align: left;

  & > .title {
    font-size: $fontSizeBig;
    text-align: center;
  }

  & > .subtitle {
    text-align: center;
  }
  &.theme-light {
    color: $colorBlack;
    background-color: $colorWhite;
  }

  &.theme-dark {
    color: $colorWhite;
    background-color: $colorBlack;
  }

}
</style>
