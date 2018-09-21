<template>
  <div style="margin-top:10px;">
    <el-form-item v-for="item in tableFieldMap.columns" v-if="item.isSeek=='0'">
      <!--时间选择框-->
      <div v-if="item.inputType=='2'|| item.inputType=='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
        <div class="el-input-group__prepend date">{{item.pageComment}}</div>
        <el-date-picker style="line-height: 18px;"
          v-model="value[item.fieldName]" value-format="yyyy-MM-dd"
          type="daterange"
          size="mini"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
        </el-date-picker>
      </div>
      <!--下拉选择-->
      <div v-else-if="item.inputType=='4' || item.inputType=='5'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
        <div class="el-input-group__prepend">{{item.pageComment}}</div>
        <el-select clearable v-model="value[item.fieldName]" :placeholder="item.pageComment" style="width:100%;" size="mini">
          <el-option
            v-for="itemss in getBusConfig(model+pathUrl,item.dictionaryIndex).list"
            :key="itemss.confName"
            :label="itemss.confName"
            :value="itemss.confVue">
          </el-option>
        </el-select>
      </div>
      <!--普通输入框-->
      <el-input v-model="value[item.fieldName]" :content="item.pageComment" :placeholder="item.pageComment" clearable size="mini"v-else>
        <template slot="prepend">{{item.pageComment}}</template>
      </el-input>
    </el-form-item>
  </div>
</template>

<script>
  export default {
    name: 'seek',
    data() {
      return {

      }
    },
    watch:{
      value:{
        handler: function (seekData) {
          this.$emit('input', seekData)
        },
        deep: true    //深度监听
      },
    },
    created(){

    },
    props: {
      // 使用v-module必须要使用value
      value: {
        default: '',
      },
      pathUrl: {
        type: String
      },
      model: {
        type: String
      },
      tableFieldMap: {
        type:Object
      },
      busConfig: {
        type:Object
      },
    },
    methods:{
      setValue(seekData){
       // this.seekData=seekData;
      }
    }
  }
</script>

<style scoped>
  i.el-input__icon.el-range__icon.el-icon-date {
    padding-top: 4px;
  }
</style>
