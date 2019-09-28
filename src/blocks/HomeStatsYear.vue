<template>
  <fi-block 
    theme="dark"
    class="block-home-stats-year"
    :title="$t('home.stats_year._title')"
    >
    <b-container class="stats-year-container">
      <b-row>
        <ul class="year-links">
          <li>Années</li>
          <li
            v-for="year in availableYears" 
            :key="year" 
            class="year-link"
            @click="showYear(year)"
            >{{ year }}
          </li>
        </ul>
      </b-row>
      <b-row>
        <div
          class="stats-histobar"
          v-for="current in murdersByMonth"
          :key="current.month"
          >
          <fi-progress-vertical
            :max="maxByMonth"
            :value="current.value"
            :ghost="current.ghost"
            :highlight="current.diff"
            ></fi-progress-vertical>
          {{labelForMonth(current.month)}}
        </div>
      </b-row>
      <b-row class="legend">
        <b-col cols="2">
          <div class="legend-color"></div>
        </b-col>
        <b-col cols="10">
          <div class="legend-description" v-html="$t('home.stats_year.legend')">
          </div>
        </b-col>
      </b-row>
    </b-container>
  </fi-block>
</template>

<script lang="ts">
import axios from 'axios';
import { Component, Vue, Prop } from 'vue-property-decorator';
import FiBlock from '@/components/Block.vue';
import FiProgressVertical from '@/components/ProgressVertical.vue';

interface Murder {
  date: string,
  name: string
}
 
interface MurderByMonth {
  month: number,
  value: number, // the value for current month
  ghost: number, // same month, last year
  diff: number,  // difference between value & ghost
}

@Component({
  components: {
    FiBlock,
    FiProgressVertical
  },
})

export default class FiHomeStatsYear extends Vue {
  counter = 106
  availableYears = [2017, 2018, 2019]
  murdersByYear : Record<number, object> = {}
  murdersByMonth : MurderByMonth[] = []

  currentYear = 2019

  created() {
    // load data for each year
    let years = [2017, 2018, 2019]
    years.forEach(year => {
      axios.get('/murders-2019.json')
      .then(response => {
        this.murdersByYear[year] = response.data.murders
        this.murdersByMonth = this.buildByMonth(response.data.murders)
      })
      .catch(e => {
        // this.errors.push(e)
      })
    })
  }

  buildByMonth(murders : Murder[]) {
    let res : MurderByMonth[] = []

    // Passe 1 : initialize table of values
    for (let index=0; index<12; index+=1) {
      res[index] = {
        month: index + 1,
        value: 0,
        ghost: 0,
        diff: 0
      } 
    }

    // Passe 2 : on lit les infos de chaque féminicide
    // et on remplit le mois concerné
    murders.forEach((item : Murder, index, arr) => {
      // on choppe la date puis le mois
      let feminicideDate = new Date(item.date)
      let feminicideMonth = feminicideDate.getMonth()

      // on incrémente le compteur du mois en question
      res[feminicideMonth].value += 1
    })

    return res
  }

  labelForMonth(month: number) {
    let d = new Date(this.currentYear, month-1, 1)
    return this.$d(d, 'short_month')
  }

  get maxByMonth() {
    let murdersByMonth = this.murdersByMonth
    if (murdersByMonth.length < 1) { return null }

    let tmpMax = this.murdersByMonth[0].value
    murdersByMonth.forEach((item, index, arr) => {
      if (item.value > tmpMax) {
        tmpMax = item.value
      }
    })

    return tmpMax
  }
}

</script>

<style lang="scss" scoped>
@import "@/styles/_base.scss";

.block-home-stats-year {
  @include blockblood;
  text-align: left;

  .stats-histobar {
    width: calc(100% / 12);
    padding: 0 5px;
  }

  .year-links {
    list-style-type: none;
    display: flex;
    justify-content: space-between;

    .year-link {
    }
  }
}
</style>



