<template>
  <b-navbar class="fi-navigation" toggleable="sm" fixed="top">
    <!-- Brand and toggle get grouped for better mobile display -->
    <b-navbar-brand to="/#page-top">
      <img src="@/assets/feminicides-logo.svg"  alt="Féminicides . Info - Logo" id="logo" />
    </b-navbar-brand>

    <b-navbar-toggle target="navbar-menu-collapse"></b-navbar-toggle>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <b-collapse id="navbar-menu-collapse" is-nav>
      <b-navbar-nav class="ml-auto">
        <b-nav-item
          align="left"
          v-for="menuitem in routes" 
          :key="menuitem.name" 
          :to="{ name: menuitem.name }">
          {{ $t( menuitem.name + '._title' ) }}
        </b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { routes } from '@/lib/router'

@Component
export default class FiNavigation extends Vue {
  //  @Prop() private msg!: string;
  routes = routes
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
@import "@/styles/_base.scss";

.fi-navigation {
  min-height: 60px;
  padding-top: 15px;
  background-color: white;
  border-bottom: 5px solid $colorRed;
  font-size: $fontSizeNormal;
  align-items: flex-start;

  .navbar-brand img {
    width: 200px;
  }

  .navbar-nav {
    & > .nav-item {
      &:first-child {
        margin-top: 2rem;
      }

      &:last-child {
        margin-bottom: 2rem;
      }

      & > a {
        padding-left: .5rem;
      }
    }
  }

  .navbar-toggler {
    outline-color: $colorRed;

    .navbar-toggler-icon {
      width: 2.1em;
      height: 2.1em;
      background-size: 2.5rem;
    }
  }

  @include media-breakpoint-up(sm) {
    .navbar-nav {
      & > .nav-item {
        &:first-child {
          margin-top: 0;
        }

        &:last-child {
          margin-bottom: 0;
        }

        & > a {
          padding-top: 0.9rem;
          padding-left: 1rem;
          padding-right: 1rem;
        }
      }
    }
  } // media-breakpoint-up
}
</style>
