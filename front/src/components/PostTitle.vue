<template>
  <v-form>
    <!-- <v-container> -->
      <v-row>
        <v-col
          cols="12"
          sm="4"
        >
          <v-text-field
            v-model="title"
            :rules="rules"
            counter="25"
            hint="自由に書こう！" 
            label="タイトル"
          ></v-text-field>
        </v-col>
      </v-row>
    <!-- </v-container> -->
  </v-form>
</template>
<script>
  export default {
    data () {
      return {
        // title: '',
        rules: [v => v.length <= 25 || 'Max 25 characters'],
      }
    },
  }
</script>