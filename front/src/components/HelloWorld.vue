
<template>
  <v-app id="inspire">

    <!-- barの色 -->
    <v-app-bar
      app
      color="white"
      flat
    >

    <!-- 全体のレイアウト -->
      <v-container class="py-0 fill-height">
        <v-avatar
          class="mr-10"
          color="grey darken-1"
          size="32"
        ></v-avatar>
        <el-menu-item>
        <router-link to="/translator">Translator</router-link>
        </el-menu-item>
        <!--スペースをどうしても空けたい -->
        <v-btn><router-link to="/">Home</router-link></v-btn>
        <v-btn><router-link to="/post">Post</router-link></v-btn>
        <v-btn><router-link to="/signup">Signup</router-link></v-btn>
        <v-btn><router-link to="/login">Login</router-link></v-btn>
         <v-btn><router-link to="/about">About</router-link></v-btn>
         <!-- <v-btn><router-link to="/translator">Translator</router-link></v-btn> -->
        <v-spacer></v-spacer>
        <!-- レスポンシブ -->
        <v-responsive max-width="260">
          <v-text-field
            dense
            flat
            hide-details
            rounded
            solo-inverted
          ></v-text-field>
        </v-responsive>
      </v-container>
    </v-app-bar>
<!--ヘッダーより下のメイン -->
    <v-main class="grey lighten-3">
      <v-container>
        <v-row>
          <!-- サイドバー -->
          <v-col cols="2">
            <v-sheet rounded="lg">
              <v-list color="transparent">
                <v-list-item
                  v-for="n in 5"
                  :key="n"
                  link
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      List Item {{ n }}
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider class="my-2"></v-divider>

                <v-list-item
                  link
                  color="grey lighten-4"
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      Refresh
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-sheet>
          </v-col>

          <v-col>
            <v-sheet
              min-height="70vh"
              rounded="lg"
            >
              <!--  -->
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
// import axios from 'axios'

  export default {
    data: () => ({
    
    }),
  }
</script>

