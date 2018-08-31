<template>
  <!--<div class="site-content site-content&#45;&#45;home">-->
  <!--<el-card :style="contentViewStyles">-->
  <!--<h3>公司介绍</h3>-->
  <!--<p>三智头智能科技集团是一家全球领先的人工智能领域综合型集团企业，致力于为全球各产业提供智能升级、产业整合，商业布局、软件研究，大数据服务等一体化解决方案， 集团总部位于广东省佛山市，在深圳设有软硬件研发中心，与美国、德国、日本等多个科技发达国家人工智能领域科学研究院达成了战略合作伙伴关系，依托于强大的技术背景以及政府的扶持， 三智头智能科技集团，自成立之日起在科技前沿领域迅猛发展，企业分别获得了中力资本、博将资本，东方富海等创投机构的青睐，三智头智能科技集团致力于为各行业细分领域进行赋能、创新和转型， 为进一步推动中国工业4.0的发展而努力。-->

  <!--集团拥有一支锐意进取，励精图治的核心领导团队，拥有高度的社会责任感和历史使命感， 团队聚集了一批来自各个细分领域的顶级人才，具有丰富的行业经验，自创始以来，三智头智能科技集团的理念和方向得到了社会各界的广泛的认可和支持。-->

  <!--集团旗下分别成立了三智头智能科技、工业壹号科技、三智头商业智库、三智头软件研究中心、三智头大数据产业创投基金、佛山软服众创科技等前沿科技企业。</p>-->
  <!--<iframe src="https://datav.aliyun.com/share/560a7e409bfeecf6fba819bf2643e096" style="width: 100%;height: 720px"></iframe>-->
  <!--</el-card>-->
  <!--</div>-->
  <div class="home">
    <div class="home_slide">
      <!-- swiper -->
      <swiper :options="swiperOption">
        <swiper-slide>
          <div class="home_model">
            {发的发到付}
          </div>
        </swiper-slide>
        <div class="swiper-button-prev" slot="button-prev"></div>
        <div class="swiper-button-next" slot="button-next"></div>
      </swiper>
    </div>
    <div class="file_work">
      <div class="file_cab">
        <el-card class="file-card">
          <div class="file_top">
            <p>文件柜</p>
            <span>×</span>
          </div>
          <div class="file_cont">
            <ul>
              <li>公司网盘</li>
              <li>个人网盘</li>
              <li>我的分享</li>
              <li>我收到的</li>
            </ul>
          </div>
        </el-card>
      </div>
      <div class="work_jour">
        <el-card class="file-card">
          <div class="file_top work_top">
            <p>工作日志</p>
            <ul>
              <li>个人</li>
              <li>评阅</li>
            </ul>
            <span>×</span>
          </div>
          <div class="work_deta">
            <datepicker :inline="true"></datepicker>
            <button @click="addOrUpdateHandle()">写日志</button>
          </div>
        </el-card>
      </div>
      <div class="work_jour">
        <el-card class="file-card" @keyup.enter.native="getDataList()">
          <div class="file_top work_top">
            <p>我的邮件</p>
            <ul>
              <li>内部收件箱</li>
              <li>未读</li>
              <li>待办</li>
            </ul>
            <span>×</span>
          </div>
          <div class="work_deta">
            <ul>
              <li v-for="dataList in dataList">
                <div class="work_tit">{{dataList.title}}</div>
              </li>
            </ul>
            <p style="text-align: center;margin-top:20px;"><a href="javascript:;">查看更多邮件</a></p>
          </div>
        </el-card>
      </div>
      <div class="work_jour">
        <el-card class="file-card">
          <div class="file_top work_top">
            <p>我的邮件</p>
            <ul>
              <li>个人</li>
              <li>评阅</li>
            </ul>
            <span>×</span>
          </div>
          <div class="work_deta">
            <ul>
              <li v-for="work_hui in work_hui">
                <div class="work_hui">
                  {{work_hui.work_hui_tit}}
                </div>
              </li>
            </ul>
            <p style="text-align: center;margin-top:20px;"><a href="javascript:;">查看更多总结</a></p>
          </div>
        </el-card>
      </div>
    </div>
    <div class="home_page">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage4"
        :page-sizes="[100, 200, 300, 400]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="400">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import API from '@/api'
  export default {
    components: {
      API
    },
    data () {
      return {
        model: 'oa',
        pathUrl: 'oaemaildrafts',
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        dataForm: {},
        dataList: [],
        swiperOption:[],
        // 操作按钮
        operation: [
          // {'scope': 'delete', fun: this.hideTableField, name: '显示所有字段'}
        ],
        saveForm: {
          id: 0,
          remarks: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          sort: '',
          deleteFlag: '',
          receiver: '',
          receiverNo: '',
          sender: '',
          senderNo: '',
          sendTime: '',
          theme: '',
          content: '',
          type: '',
          state: '',
          isReceipt: '',
          relevanceMainline: '',
          fileName: '',
          filePath: '',
          deleteBy: '',
          createUserName: '',
          createMac: '',
          updateUserName: '',
          updateIp: '',
          updateMac: '',
          deleteUserName: '',
          deleteIp: '',
          deleteMac: '',
          deleteTime: '',
          createIp: ''
        }
      }
    },
    activated () {
      this.getDataList()
    },
    methods: {
      addOrUpdateHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.addOrUpdateHandle()
        })
      },
      deleteHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.deleteHandle()
        })
      },
      setListSelections (val) {
        this.dataListSelections = val
      },
      // 获取数据
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        var params = {
          page: this.pageIndex,
          limit: this.pageSize,
          sidx: this.sortData.sidx,
          order: this.sortData.order
        }
        API.oaemaildrafts.list(params).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.data.list
            this.totalPage = data.data.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      }
    }
  }
</script>

<style scoped>
  /*.site-content--home {*/
  /*line-height: 1.5;*/
  /*}*/
  ul {
    margin: 0;
    padding: 0;
  }

  .home {
    padding: 20px;
    background: #fff;
  }

  .home_model {
    width: 100%;
    height: 120px;
    text-align: center;
    color: #fff;
    font-size: 16px;
    line-height: 120px;
    margin: 0 auto;
    cursor: pointer;
  }

  .swiper-container {
    height: auto !important;
    margin-left: auto;
    margin-right: auto;
    padding: 0 40px;
  }

  .swiper-slide {
    background: rgba(107, 107, 107, 1);
  }

  .home_slide {
    width: 100%;
  }

  .swiper-button-prev {
    left: 0;
  }

  .file-card {
    border: 1px solid #ccc;
    border-radius: 10px;
    margin-bottom: 40px;
  }

  .file_work {
    display: table;
    width: 100%;
    margin-top: 50px;
  }

  .file_cab {
    width: 50%;
    float: left;
    padding: 0 30px;
  }

  .work_jour {
    width: 50%;
    float: left;
    padding: 0 30px;
  }

  .file_top {
    border-bottom: 1px solid #ccc;
  }

  .el-card__body {
    padding: 0;
  }

  .file_top {
    padding: 15px;
    position: relative;
  }

  .file_top p {
    margin: 0;
    font-size: 20px;
    font-weight: bold;
  }

  .file_cont {
    display: table;
    width: 100%;
    padding: 60px 20px;
    min-height: 350px;
  }

  .file_cont ul {
    margin: 0;
    padding: 0;
  }

  .file_cont li {
    display: inline-block;
    border-radius: 10px;
    background: #FF9900;
    box-shadow: 0 0 5px #000;
    list-style: none;
    width: 39%;
    text-align: center;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    margin: 0 22px;
    margin-bottom: 30px;
    padding: 40px;
    cursor: pointer;
  }

  .file_cont li:nth-child(2) {
    background: #FF0000
  }

  .file_cont li:nth-child(3) {
    background: #00CC99;
    margin-bottom: 0;
  }

  .file_cont li:nth-child(4) {
    background: #3399CC;
    margin-bottom: 0;
  }

  .file_top span {
    position: absolute;
    right: 0;
    display: inline-block;
    top: 0;
    width: 73px;
    height: 100%;
    text-align: center;
    font-size: 32px;
    border-left: 1px solid #ccc;
    line-height: 55px;
    cursor: pointer;
  }

  .file_top span:hover {
    background: rgba(102, 102, 102, 1);
    color: #fff;
  }

  .file_cont li:hover {
    opacity: 0.7;
  }

  .work_top p {
    display: inline-block;
  }

  .work_top ul {
    display: inline-block;
    margin-left: 40px;
  }

  .work_top li {
    display: inline-block;
    margin-right: 10px;
    position: relative;
    cursor: pointer;
    padding: 0 10px;
  }

  .work_top li:hover {
    color: #3399CC;
  }

  .work_top li:hover:after {
    content: "";
    position: absolute;
    height: 2px;
    background: #3399CC;
    width: 100%;
    left: 0;
    bottom: -18px;
  }

  .work_deta .vdp-datepicker .vdp-datepicker__calendar {
    /*padding:15px;*/
    width: 100% !important;
    border: none;
  }

  .work_deta button {
    width: 122px;
    height: 40px;
    color: #fff;
    font-size: 18px;
    line-height: 40px;
    border: none;
    background: #3399CC;
    border-radius: 4px;
    float: right;
    margin-right: 20px;
    cursor: pointer;
  }

  .work_deta {
    /*padding-bottom: 30px;*/
    display: table;
    min-height: 350px;
    width: 100%;
  }

  .work_deta button:hover {
    opacity: 0.7;
  }

  .work_deta li {
    border-bottom: 1px solid #ccc;
    /*padding:15px 0;*/
    list-style: none;
    display: table;
    width: 100%;
  }

  .work_tit {
    float: left;
    width: 60%;
    padding: 15px 0;
    padding-left: 15px;
  }

  .work_tit:hover, .work_man:hover {
    background: rgba(242, 242, 242, 1);
  }

  .work_man {
    float: left;
    width: 40%;
    padding: 15px 0;
    padding-left: 15px;
  }

  .work_hui {
    padding: 15px 0;
    padding-left: 15px;
    display: table;
    width: 100%;
  }

  .work_hui:hover {
    background: rgba(242, 242, 242, 1);
  }

  .home_page{
    text-align: center;
    margin:30px 0;
  }
</style>

