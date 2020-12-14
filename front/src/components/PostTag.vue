<template>
  <!-- <v-card>
    <v-container fluid> -->
      <v-row
        align="center"
      >
        <v-col
          cols="12"
          sm="4"
        >
        <p>タグを選ぶ</p>
          <v-select
            v-model="value"
            :items="items"
            chips
            label="tags"
            multiple
            solo
          ></v-select>
        </v-col>
      </v-row>
    <!-- </v-container>
  </v-card> -->
</template>
<script>
  export default {
    data: () => ({
      items: ['foo', 'bar', 'fizz', 'buzz'],
      value: ['foo', 'bar', 'fizz', 'buzz'],
    }),
  }
</script>
