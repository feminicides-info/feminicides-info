<template>
  <fi-block class="fi-footer" theme="dark">
    <b-container class="block-home-meaning-container">
      <b-row>
        <b-col cols="12" sm="4" md="4">
          <h3>Agir</h3>
          <ul>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </b-col>
        <b-col cols="12" sm="4" md="4">
          <h3>En savoir plus</h3>
          <ul>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </b-col>
        <b-col cols="12" sm="4" md="4">
          <h3>Divers</h3>
          <ul>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </b-col>
      </b-row>
    </b-container>
  </fi-block>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { routes } from '@/lib/router'
import FiBlock from '@/components/Block.vue';

@Component({
  components: {
    FiBlock
  },
})

export default class FiFooter extends Vue {
  //  @Prop() private msg!: string;
  routes = routes
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "@/styles/_base.scss";

.fi-footer {
  height: 400px;
  background-color: $colorBlack;
}
</style>
