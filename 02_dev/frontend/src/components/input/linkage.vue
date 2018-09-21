<template>
  <div   class="el-input el-input-group el-input-group--prepend el-input--suffix" >
    <div class="el-input-group__prepend" v-if="pageComment!=''">{{pageComment}}</div>
    <el-cascader size="mini" v-model="val"
                 :placeholder="pageComment"
                 @active-item-change="handleSelect"
                 :options="options2" style="width:100%;"
                 filterable
                 :props="props"
    ></el-cascader>
  </div>
</template>

<script>
  import {getAddress,queryAddressById} from '@/utils'
    export default {
        name: "linkage",
      data () {
        return {
          val:null,
          options2:getAddress(0,this.level),
          props: {
            label:"areaname",
            value: 'id',
            children: 'children'
          },
        }
      },
      watch:{
        val (val) {
          console.log(val);
           this.$emit('input', val)
        }
      },
      props: {
        // 使用v-module必须要使用value
        value: {
          default: '',
        },
        //层级选择,默认为3级,还有4级可以选
        level:{
          type:Number,
          default:3
        },
        //注释
        pageComment:{
          type:String,
          default:''
        }
      },
      methods:{
        //地址的选中方法
        handleSelect(item) {
          //获得层级
          var level = item.length;
          var address = [];
          queryAddressById(this.options2,item[level-1],address);
          if(address[0].isNext!='0' && address[0].children.length==0){
            address[0].children=getAddress(item[level-1],this.level);
            var children = address[0].children;
            // for (var j = 0; j < children.length; j++) {
            //   var item1 = children[j];
            //   this.optionsMap[item1.id] = item1;
            // }
          }
        },
      }
    }
</script>

<style scoped>

</style>
