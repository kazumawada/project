<template>
  <v-card>
    <v-system-bar></v-system-bar>
    <v-toolbar flat>
     <!-- userImage -->
    <v-avatar>
      <img :src="$auth.user.picture">
    </v-avatar>
      <!-- userName -->
      <v-toolbar-title>{{ $auth.user.nickname }}</v-toolbar-title>
      <v-spacer></v-spacer>
      <div>
      <v-btn
        text
        color="deep-purple accent-4"
      >
        Follow
      </v-btn>
       <v-btn
        text
        color="deep-purple accent-4"
      >
        Edit
      </v-btn>
      </div>
    </v-toolbar>
    <v-banner
      single-line
      :sticky="sticky"
    >
      description here.
    </v-banner>
    <v-card-text class="grey lighten-4">
      <v-sheet
        max-width="800"
        height="300"
        class="mx-auto"
      ></v-sheet>
    </v-card-text>
  </v-card>
</template>
<script>
  export default {
    data: () => ({
      sticky: false,
    }),
  }
</script>

