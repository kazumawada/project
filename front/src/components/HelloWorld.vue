
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

        <!----- ロゴ ----->
        <!-- <v-avatar
          class="mr-10"
          color="grey darken-1"
          size="32"
        ></v-avatar> -->
         <v-avatar>
          <img
           src="../assets/German.png"
            alt="logo"
            > 
           </v-avatar> 
        <!---- ロゴここまで ---->



        <!-- <el-menu-item>
        <router-link to="/translator">Translator</router-link>
        </el-menu-item> -->
        <!--スペースをどうしても空けたい -->
        <!-- これは、ボタンではなく、navを使って作っている。そのうちに取り替える。https://yacchi-engineer.com/?p=1219 -->
        <v-btn><router-link to="/">Home</router-link></v-btn>
        <v-btn><router-link to="/post">Post</router-link></v-btn>
        <v-btn><router-link to="/signup">Signup</router-link></v-btn>
        <v-btn><router-link to="/login">Login</router-link></v-btn>
         <v-btn><router-link to="/playground">playground</router-link></v-btn>
         <v-btn><router-link to="/smoothLogin">かんたんログイン</router-link></v-btn>
         <v-btn><router-link to="/playGround02">playground02</router-link></v-btn>
          <!-- <v-btn><router-link to="/profile">Profile</router-link></v-btn> -->
          <!-- もし認証されたら、このボタンが表示される -->
          <v-btn><router-link v-if="$auth.isAuthenticated" to="/profile">auth0Profile</router-link></v-btn>

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
<!------------------------------------------------ヘッダーより下 --------------------------------------------------------------------------------->
    <v-main class="grey lighten-3">
      <v-container>
        <v-row>
<!------------------------------------- サイドバー -------------------------------------->
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
                      タグ一覧
                      <i class="fas fa-tag"></i>
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-sheet>
          </v-col>

          <v-col>
<!------------------------------------------------ ここから右グリット---------------------------------------------------->
            <v-card
    flat
    tile
  >
    <v-container
      v-for="type in types"
      :key="type"
      class="grey lighten-4"
      fluid
    >
    <!--------------------------------------- navここから----------------------------------->
    <!-- https://vuetifyjs.com/ja/components/tabs/#  -->
    <v-tabs >
      <v-tab class="mx-auto">新着投稿</v-tab>
      <v-tab class="mx-auto">人気投稿</v-tab>
      <v-tab class="mx-auto">news</v-tab>
      <v-tab class="mx-auto">ドイツ語</v-tab>
</v-tabs>
 <!--------------------------------------- navここまで----------------------------------->
      <v-subheader>{{ type }}</v-subheader>
      <v-row>
        <v-spacer></v-spacer>
        <v-col
          v-for="card in cards"
          :key="card"
          cols="12"
          sm="6"
          md="4"
        >
          <v-card>
            <v-img
              :src="`https://picsum.photos/200/300?image=${getImage()}`"
              height="300px"
            >
              <span
                class="headline white--text pl-4 pt-4 d-inline-block"
                v-text="card"
              ></span>
            </v-img>

            <v-card-actions class="white justify-center">
              <!-- <v-btn
                v-for="(social, i) in socials"
                :key="i"
                :color="social.color"
                class="white--text"
                fab
                icon
                small
              >
               
              </v-btn> -->
  <!----------- iconここから ----------------------------->
              <div><i class="fas fa-user"></i></div>
              <div>
              <p>title</p> 
              <p>time</p>
              <v-chip>
               <v-icon left>
               mdi-label
               </v-icon>
               German
              </v-chip>
              <!-- <i class="fas fa-tag"></i> -->
              </div>
              
<!--------------------- iconここまで ----------------------->
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
<!--------------------------------------- ここまで右グリット ------------------------------------------------------>
            <!-- 
              これは、白いシート
              <v-sheet
              min-height="70vh"
              rounded="lg"
            >
            </v-sheet> -->
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
          types: ['Places to Be'],
      cards: ['Good', 'Best', 'Finest', 'Blessed', 'Happiness', 'Smile', 'Achive', 'Positive', 'Gold'],
      
    }),

   methods: {
      getImage () {
        const min = 550
        const max = 560

        return Math.floor(Math.random() * (max - min + 1)) + min
      },
    },
  }
</script>

