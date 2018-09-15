<template>
  <div style="margin-top:10px;">
    <el-form-item v-for="item in tableFieldMap.columns" v-if="item.isSeek=='0'">
      <!--时间选择框-->
      <div v-if="item.inputType=='2'|| item.inputType=='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
        <div class="el-input-group__prepend date">{{item.pageComment}}</div>
        <el-date-picker style="line-height: 18px;"
          v-model="dataForm[item.fieldName]" value-format="yyyy-MM-dd"
          type="daterange"
          size="mini"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
        </el-date-picker>
      </div>
      <!--下拉选择-->
    <!--  <div data-v-404e6133="" >
        <div class="el-input-group__prepend">主键</div>
        <input type="text" autocomplete="off" content="主键" placeholder="主键" class="el-input__inner">&lt;!&ndash;&ndash;&gt;&lt;!&ndash;&ndash;&gt;
        &lt;!&ndash;&ndash;&gt;</div>-->
      <div v-else-if="item.inputType=='4' || item.inputType=='5'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
        <div class="el-input-group__prepend">{{item.pageComment}}</div>
        <el-select clearable v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" style="width:100%;" size="small">
          <el-option
            v-for="itemss in getBusConfig(model+pathUrl,item.dictionaryIndex).list"
            :key="itemss.confName"
            :label="itemss.confName"
            :value="itemss.confVue">
            <template slot="prepend">{{item.pageComment}}</template>
          </el-option>
        </el-select>
      </div>
      <!--普通输入框-->
      <el-input v-model="dataForm[item.fieldName]" :content="item.pageComment" :placeholder="item.pageComment" clearable size="small"
                v-else>
        <template slot="prepend">{{item.pageComment}}</template>
      </el-input>
    </el-form-item>
  </div>
</template>

<script>
  import API from '@/api'
  export default {
    name: 'seek',
    data() {
      return {
      }
    },
    props: {
      dataForm: {
        type: Object,
        default:{}
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

    }
  }
</script>

<style scoped>
  i.el-input__icon.el-range__icon.el-icon-date {
    padding-top: 4px;
  }
</style>
