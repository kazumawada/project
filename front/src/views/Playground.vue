<template>
<div class="playground">
  <p>{{ info }}</p>
</div>
</template>
<script>
import axios from 'axios'
export default {
  // el: '#playground',
  data () {
    return {
      info: null
    }
  },
   mounted () {
    axios
      .get('http://localhost:3000/api/v1/users')
      .then(response => (this.info = response))
       .catch(error => {
    console.log(error.response)
  });
  }
}
</script>