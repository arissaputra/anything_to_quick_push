<template>
  <div id="app">
    <img class="test" width="25%" src="./assets/logo.png">
    <h1>Pilih jep</h1>
    <select v-model="selected" @change="domainChanged($event)">
      <option value>select</option>
      <option v-for="(val,index) in myOptions" :key="index">{{val}}</option>
    </select>
    
    <button data-toggle="popover" data-trigger="focus" class="showInterest">Click me</button>

    <!-- popover validation -->
    <div class="row" style="display:none;">
      <span id="popover_validation">
        <div class="popover popover-validation" role="tooltip">
          <div class="arrow"></div>
          <h3 class="popover-header"></h3>
          <div class="popover-body"></div>
        </div>
      </span>
      <span id="popover_validation_content">
        You need a paid account to do that.
        <a href="/register">Find out more</a>
        <i id="closePopover" class="fa fa-times"></i>
      </span>
    </div>
    <!-- / popover validation -->
  </div>
</template>

<script>
import "jquery";
// import "popper.js";
// import "bootstrap";
import $ from "jquery";
require("expose-loader?$!expose-loader?jQuery!jquery");
export default {
  name: "App",
  beforeUpdate() {
    $(".showInterest").popover({
      html: true,
      template: $("#popover_validation").html(),
      content: $("#popover_validation_content"),
      placement: "top"
    });
  },
  methods: {
    popOver(ops) {
      if (ops === "hide") {
        return $("h1").hide();
      }
      $("h1").show();
    },
    domainChanged() {
      if (this.selected === "option2") {
        return this.popOver("hide");
      }
      return this.popOver("show");
    }
  },
  data() {
    return {
      selected: "",
      myOptions: ["option1", "option2"]
    };
  },
  mounted() {
    $(".test").click(function() {
      alert("test aja");
    });
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>