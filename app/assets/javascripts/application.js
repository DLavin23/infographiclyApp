// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


$(function () {
    var chart;

    $(document).ready(function() {

        chart = new Highcharts.Chart({

            chart: {

                renderTo: 'container',

                plotBackgroundColor: null,

                plotBorderWidth: null,

                plotShadow: false

            },

            title: {

                text: 'Browser market shares at a specific website, 2010'

            },

            tooltip: {

                formatter: function() {

                    return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';

                }

            },

            plotOptions: {

                pie: {

                    allowPointSelect: true,

                    cursor: 'pointer',

                    dataLabels: {

                        enabled: true,

                        color: '#000000',

                        connectorColor: '#000000',

                        formatter: function() {

                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';

                        }

                    }

                }

            },

            series: [{

                type: 'pie',

                name: 'Browser share',

                data: [

                    ['Firefox',   45.0],

                    ['IE',       26.8],

                    {

                        name: 'Chrome',

                        y: 12.8,

                        sliced: true,

                        selected: true

                    },

                    ['Safari',    8.5],

                    ['Opera',     6.2],

                    ['Others',   0.7]

                ]

            }]

        });

    });

    
});​