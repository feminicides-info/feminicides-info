<template>
  <div class="fi-progress-vertical">
    <div class="bar-ghost"
         :style="{ height: (100 * highlight / max) + '%' }"
         ></div>
    <div class="bar-value" 
         :style="{ height: (100 * value / max) + '%' }"
         >
      <div class="bar-label">{{ value }}</div>
      <div class="bar-highlight"
           :style="{ height: (100 * highlight / value) + '%' }"
           ></div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator'

@Component
export default class FiProgressVertical extends Vue {
  @Prop({ default: 100 })
  max !: number 

  @Prop({ default: 50 })
  value !: number 

  // TODO: set to 0
  @Prop({ default: 70 })
  ghost !: number 

  @Prop({ default: 20 })
  highlight !: number 

  //@Prop({ })

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "@/styles/_base.scss";

.fi-progress-vertical {
  margin-top: 30px;
  position: relative;
  width: 100%;
  height: 100px;
  
  .bar-label {
    color: white;
    top: -30px;
    font-weight: bold;
    text-align: center;
    position: relative;
  }

  .bar-ghost {
    position: absolute;
    width: 100%;
    background-color: rgba(255,255,255,0.25);
    left: 0;
    bottom: 0;
  }

  .bar-value {
    position: absolute;
    width: 100%;
    background-color: white;
    left: 0;
    bottom: 0;
  }

  .bar-highlight {
    position: absolute;
    width: 100%;
    height: 20%;
    background-color: $colorRed;
    left: 0;
    top: 0;
  }
}
</style>
