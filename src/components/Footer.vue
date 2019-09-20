<template>
  <footer class="fi-footer">
  </footer>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { routes } from '@/lib/router'

@Component
export default class FiFooter extends Vue {
  //  @Prop() private msg!: string;
  routes = routes
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "@/styles/_base.scss";

.fi-footer {
  height: 200px;
  background-color: $colorBlack;
}
</style>
