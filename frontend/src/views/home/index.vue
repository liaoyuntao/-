<template>
  <!--<div class="site-content site-content&#45;&#45;home">-->
    <!--<el-card :style="contentViewStyles">-->
      <!--<h3>公司介绍</h3>-->
      <!--<p>三智头智能科技集团是一家全球领先的人工智能领域综合型集团企业，致力于为全球各产业提供智能升级、产业整合，商业布局、软件研究，大数据服务等一体化解决方案， 集团总部位于广东省佛山市，在深圳设有软硬件研发中心，与美国、德国、日本等多个科技发达国家人工智能领域科学研究院达成了战略合作伙伴关系，依托于强大的技术背景以及政府的扶持， 三智头智能科技集团，自成立之日起在科技前沿领域迅猛发展，企业分别获得了中力资本、博将资本，东方富海等创投机构的青睐，三智头智能科技集团致力于为各行业细分领域进行赋能、创新和转型， 为进一步推动中国工业4.0的发展而努力。-->

        <!--集团拥有一支锐意进取，励精图治的核心领导团队，拥有高度的社会责任感和历史使命感， 团队聚集了一批来自各个细分领域的顶级人才，具有丰富的行业经验，自创始以来，三智头智能科技集团的理念和方向得到了社会各界的广泛的认可和支持。-->

        <!--集团旗下分别成立了三智头智能科技、工业壹号科技、三智头商业智库、三智头软件研究中心、三智头大数据产业创投基金、佛山软服众创科技等前沿科技企业。</p>-->
      <iframe src="https://datav.aliyun.com/share/560a7e409bfeecf6fba819bf2643e096" style="width: 100%;height: 720px"></iframe>
    <!--</el-card>-->
  <!--</div>-->
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    computed: {
      contentViewStyles () {
        var height = this.$store.state.documentClientHeight
        height -= 50 // site-topbar
        height -= 15 // site-content padding-top
        height -= 15 // site-content padding-bottom
        height += 'px'
        return [
          { minHeight: height }
        ]
      }
    }
  }
</script>

<style>
  .site-content--home {
    line-height: 1.5;
  }
</style>

