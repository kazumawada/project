<template>
<div id="post">
  <!-- <v-card> -->
    <v-container fluid>
    <v-row>
      <v-col
        cols="10"
      >
      <h1>記事作成ページ</h1>
<!-- タイトル -->
 <PostTitle />
<!-- tag -->
 <PostTag />
<!-- サムネイル -->
<PostThumbnail />
<!-- コンテンツ -->
  <!-- <v-app id="inspire"> -->
      <v-textarea
        counter
        label="投稿(2000文字まで)"
        :rules="rules"
        :value="value"
      ></v-textarea>
  <!-- </v-app> -->
<!-- 記事作成ボタン-->
  <!-- <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="validate"
    > -->
    <v-btn
      color="black"
      class="mr-4"
      @click="validate"
    > 
      投稿する
    </v-btn>

       </v-col>
    </v-row>
</v-container>
  <!-- </v-card> -->

</div>
</template>
<script>
import PostTitle from '@/components/PostTitle.vue'
import PostTag from '@/components/PostTag.vue'
import PostThumbnail from '@/components/PostThumbnail.vue'

  export default {
    name: 'post',
    components: {
      PostTitle,
      PostTag,
      PostThumbnail
    },
    el: '#post',
    data: () => ({
      rules: [v => v.length <= 2000 || 'Max 2000 characters'],
      value: '',
    }),
    methods: {
      //緑の送信ボタン
      validate () {
        this.$refs.form.validate()
      }
      },

  }
</script>



