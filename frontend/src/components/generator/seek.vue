<template>
  <div >
  <el-form-item v-for="item in tableFieldMap[pathUrl].isSeekList">
    <!--时间选择框-->
    <el-tooltip class="item" effect="dark" :content="item.pageComment" placement="top-start" v-if="item.inputType=='2'|| item.inputType=='3'">
      <el-date-picker
        v-model="dataForm[item.fieldName]" value-format="yyyy-MM-dd"
        type="daterange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"><template slot="prepend">{{item.pageComment}}</template>
      </el-date-picker>
    </el-tooltip>
    <!--下拉选择-->
    <el-select  clearable  v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" style="width:100%;" v-else-if="item.inputType=='4' || item.inputType=='5'">
      <el-option
        v-for="itemss in busConfig[pathUrl+item.fieldnames].list"
        :key="itemss.confName"
        :label="itemss.confName"
        :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
      </el-option>
    </el-select>
    <!--普通输入框-->
    <el-input v-model="dataForm[item.fieldName]" :content="item.pageComment" :placeholder="item.pageComment" clearable v-else><template slot="prepend">{{item.pageComment}}</template></el-input>
  </el-form-item>
    </div>
</template>

<script>
    export default {
      name: 'seek',
      data () {
        return {
          busConfig: this.busConfig,
          tableFieldMap: this.tableFieldMap
        }
      },
      props: {
        dataForm: {
          type: Object
        },
        pathUrl: {
          type: String
        }
      }
    }
</script>

<style scoped>

</style>
