<template>
  <div style="margin-top:10px;">
    <el-form-item v-for="item in tableFieldMap[pathUrl].isSeekList">
      <!--时间选择框-->
      <div v-if="item.inputType=='2'|| item.inputType=='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
        <div class="el-input-group__prepend">{{item.pageComment}}</div>
        <el-tooltip class="item" effect="dark" :content="item.pageComment" placement="top-start" style="    padding: 0px 13px;" >
          <el-date-picker
            v-model="dataForm[item.fieldName]" value-format="yyyy-MM-dd"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
            <template slot="prepend">{{item.pageComment}}</template>
          </el-date-picker>
        </el-tooltip>
      </div>
      <!--下拉选择-->
    <!--  <div data-v-404e6133="" >
        <div class="el-input-group__prepend">主键</div>
        <input type="text" autocomplete="off" content="主键" placeholder="主键" class="el-input__inner">&lt;!&ndash;&ndash;&gt;&lt;!&ndash;&ndash;&gt;
        &lt;!&ndash;&ndash;&gt;</div>-->
      <div v-else-if="item.inputType=='4' || item.inputType=='5'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
        <div class="el-input-group__prepend">{{item.pageComment}}</div>
        <el-select clearable v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" style="width:100%;">
          <el-option
            v-for="itemss in getBusConfig(item.dictionaryIndex).list"
            :key="itemss.confName"
            :label="itemss.confName"
            :value="itemss.confVue">
            <template slot="prepend">{{item.pageComment}}</template>
          </el-option>
        </el-select>
      </div>

      <!--普通输入框-->
      <el-input v-model="dataForm[item.fieldName]" :content="item.pageComment" :placeholder="item.pageComment" clearable
                v-else>
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
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap
      }
    },
    props: {
      dataForm: {
        type: Object,
        default:{}
      },
      pathUrl: {
        type: String
      }
    }
  }
</script>

<style scoped>

</style>
