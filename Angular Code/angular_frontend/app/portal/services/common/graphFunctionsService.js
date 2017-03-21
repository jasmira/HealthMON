angular.module('healthMon').service('graphFunctions', function() {
    this.displayDonutChart = function (data) {
        var chartDonut = null;
        chartDonut = c3.generate({
            bindto: '#chartDonut',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: data,
                type : 'donut',      
                colors: {
                    normal: '#00A651',
                    moderate: '#53C0E8',
                    severe: '#CE0707'
                },
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            donut: {
                //title: "HB range (g/DI)",
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartDonut.transform('donut');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayDonutChart1 = function (data) {
        var chartDonut = null;
        chartDonut = c3.generate({
            bindto: '#chartDonut1',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: data,
                type : 'donut',      
                colors: {
                    normal: '#00A651',
                    moderate: '#53C0E8',
                    severe: '#CE0707'
                },
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            donut: {
                //title: "HB range (g/DI)",
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartDonut.transform('donut');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayDonutChart2 = function (data) {
        var chartDonut = null;
        chartDonut = c3.generate({
            bindto: '#chartDonut2',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: data,
                type : 'donut',      
                colors: {
                    normal: '#00A651',
                    moderate: '#53C0E8',
                    severe: '#CE0707'
                },
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            donut: {
                //title: "HB range (g/DI)",
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartDonut.transform('donut');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayDonutChart3 = function (data) {
        var chartDonut = null;
        chartDonut = c3.generate({
            bindto: '#chartDonut3',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: data,
                type : 'donut',      
                colors: {
                    normal: '#00A651',
                    moderate: '#53C0E8',
                    severe: '#CE0707'
                },
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            donut: {
                //title: "HB range (g/DI)",
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartDonut.transform('donut');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayDonutChart4 = function (data) {
        var chartDonut = null;
        chartDonut = c3.generate({
            bindto: '#chartDonut4',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: data,
                type : 'donut',      
                colors: {
                    normal: '#00A651',
                    moderate: '#53C0E8',
                    severe: '#CE0707'
                },
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            donut: {
                //title: "HB range (g/DI)",
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartDonut.transform('donut');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayPieChart = function (data) {
        var chartPie = null;
        chartPie = c3.generate({
            bindto: '#chartPie',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: [data.risk, data.normal],
				/*'High Risk Patients': 'none',
                        'Normal Patients': '#275073'*/
                colors: {
                    'High Risk Patients': '#275073',
                    'Normal Patients': '#1DBD9D',
					
                },
                type : 'pie',
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartPie.transform('pie');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayPieChart1 = function (data) {
        var chartPie = null;
        chartPie = c3.generate({
            bindto: '#chartPie1',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: [data.risk, data.normal],
				/*'High Risk Patients': 'none',
                        'Normal Patients': '#275073'*/
                colors: {
                    'High Risk Patients': '#275073',
                    'Normal Patients': '#1DBD9D',
					
                },
                type : 'pie',
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartPie.transform('pie');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayPieChart2 = function (data) {
        var chartPie = null;
        chartPie = c3.generate({
            bindto: '#chartPie2',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: [data.risk, data.normal],
				/*'High Risk Patients': 'none',
                        'Normal Patients': '#275073'*/
                colors: {
                    'High Risk Patients': '#275073',
                    'Normal Patients': '#1DBD9D',
					
                },
                type : 'pie',
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartPie.transform('pie');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayPieChart3 = function (data) {
        var chartPie = null;
        chartPie = c3.generate({
            bindto: '#chartPie3',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: [data.risk, data.normal],
				/*'High Risk Patients': 'none',
                        'Normal Patients': '#275073'*/
                colors: {
                    'High Risk Patients': '#275073',
                    'Normal Patients': '#1DBD9D',
					
                },
                type : 'pie',
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartPie.transform('pie');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayPieChart4 = function (data) {
        var chartPie = null;
        chartPie = c3.generate({
            bindto: '#chartPie4',
            data: {
                /*columns: [
                    ['normal', 30],
                    ['moderate', 120],
                    ['severe', 50],
                ],*/
                columns: [data.risk, data.normal],
				/*'High Risk Patients': 'none',
                        'Normal Patients': '#275073'*/
                colors: {
                    'High Risk Patients': '#275073',
                    'Normal Patients': '#1DBD9D',
					
                },
                type : 'pie',
                //onclick: function (d, i) { console.log("onclick", d, i); },
                //onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                //onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            size: {height:233},
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartPie.transform('pie');
        }, 0);
        /*var label = d3.select('text.c3-chart-arcs-title');
        label.html(''); // remove existant text
        label.insert('tspan').text('30').attr('dy', 0).attr('x', 0).attr('class','big-font');
        label.insert('tspan').text('Test Data').attr('dy', 20).attr('x', 0);*/
    }
    
    this.displayHorizontalBarChart = function (data,width,height) {
	    var chartHorizontalBar = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);
		if(!width && !height){
			height=285; width=233;
		}
         var colors = ['#1DBD9D', '#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073'];
        var chartHorizontalBar = c3.generate({
            bindto: '#chartHorizontalBar',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                color: function (color, d) {return colors[d.index];},
                labels: true,
				showLegend: false,
                empty: { label: { text: "No Data Available" }   },
            },
            size: {
			height:height,
			width:width},
            axis: {
                rotated: true,
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    }
                  }
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartHorizontalBar.transform('bar');
        }, 0);
    }
    
    this.displayHorizontalBarChart1 = function (data,width,height) {
	    var chartHorizontalBar = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);
		if(!width && !height){
			height=285; width=233;
		}
         var colors = ['#1DBD9D', '#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073'];
        var chartHorizontalBar = c3.generate({
            bindto: '#chartHorizontalBar1',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                color: function (color, d) {return colors[d.index];},
                labels: true,
				showLegend: false,
                empty: { label: { text: "No Data Available" }   },
            },
            size: {
			height:height,
			width:width},
            axis: {
                rotated: true,
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    }
                  }
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartHorizontalBar.transform('bar');
        }, 0);
    }
    
    this.displayHorizontalBarChart2 = function (data,width,height) {
	    var chartHorizontalBar = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);
		if(!width && !height){
			height=285; width=233;
		}
         var colors = ['#1DBD9D', '#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073'];
        var chartHorizontalBar = c3.generate({
            bindto: '#chartHorizontalBar2',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                color: function (color, d) {return colors[d.index];},
                labels: true,
				showLegend: false,
                empty: { label: { text: "No Data Available" }   },
            },
            size: {
			height:height,
			width:width},
            axis: {
                rotated: true,
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    }
                  }
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartHorizontalBar.transform('bar');
        }, 0);
    }
    
    this.displayHorizontalBarChart3 = function (data,width,height) {
	    var chartHorizontalBar = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);
		if(!width && !height){
			height=285; width=233;
		}
         var colors = ['#1DBD9D', '#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073'];
        var chartHorizontalBar = c3.generate({
            bindto: '#chartHorizontalBar3',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                color: function (color, d) {return colors[d.index];},
                labels: true,
				showLegend: false,
                empty: { label: { text: "No Data Available" }   },
            },
            size: {
			height:height,
			width:width},
            axis: {
                rotated: true,
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    }
                  }
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartHorizontalBar.transform('bar');
        }, 0);
    }
    
    this.displayHorizontalBarChart4 = function (data,width,height) {
	    var chartHorizontalBar = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);
		if(!width && !height){
			height=285; width=233;
		}
         var colors = ['#1DBD9D', '#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073', '#1DBD9D','#275073'];
        var chartHorizontalBar = c3.generate({
            bindto: '#chartHorizontalBar4',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                color: function (color, d) {return colors[d.index];},
                labels: true,
				showLegend: false,
                empty: { label: { text: "No Data Available" }   },
            },
            size: {
			height:height,
			width:width},
            axis: {
                rotated: true,
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    }
                  }
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chartHorizontalBar.transform('bar');
        }, 0);
    }
    
    this.displayVerticalBarChart = function (data) { 
        var chart = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);

        var colors = ['#1DBD9D', '#275073', '#1DBD9D', '#275073', '#1DBD9D', '#275073','#1DBD9D', '#275073','#1DBD9D', '#275073'];
        var chart = c3.generate({
            bindto: '#chartVerticalBar',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                labels: true,
                empty: { label: { text: "No Data Available" }   },
                color: function (color, d) {return colors[d.index];}
            },
            bar: {
                width: {ratio: 0.5} // this makes bar width 50% of length between ticks
            },
            size: {height:233},
            axis: {
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    },
                    label: {
                        text: 'Count',
                        position: 'outer-middle',
                    }
                  },
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chart.transform('bar');
        }, 0);
    }
    
    this.displayVerticalBarChartM1 = function (data) { 
        var chart = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);

         var colors = ['#1DBD9D', '#275073', '#1DBD9D', '#275073', '#1DBD9D', '#275073','#1DBD9D', '#275073','#1DBD9D', '#275073'];
        var chart = c3.generate({
            bindto: '#chartVerticalBarM1',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                labels: true,
                empty: { label: { text: "No Data Available" }   },
                color: function (color, d) {return colors[d.index];}
            },
            bar: {
                width: {ratio: 0.5} // this makes bar width 50% of length between ticks
            },
            size: {height:233},
            axis: {
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    },
                    label: {
                        text: 'Count',
                        position: 'outer-middle',
                    }
                  },
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chart.transform('bar');
        }, 0);
    }
    
    this.displayVerticalBarChartM2 = function (data) { 
        var chart = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);

        var colors = ['#1DBD9D', '#275073', '#1DBD9D', '#275073', '#1DBD9D', '#275073','#1DBD9D', '#275073','#1DBD9D', '#275073'];
        var chart = c3.generate({
            bindto: '#chartVerticalBarM2',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                labels: true,
                empty: { label: { text: "No Data Available" }   },
                color: function (color, d) {return colors[d.index];}
            },
            bar: {
                width: {ratio: 0.5} // this makes bar width 50% of length between ticks
            },
            size: {height:233},
            axis: {
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    },
                    label: {
                        text: 'Count',
                        position: 'outer-middle',
                    }
                  },
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chart.transform('bar');
        }, 0);
    }
    
    this.displayVerticalBarChartM3 = function (data) { 
        var chart = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);

         var colors = ['#1DBD9D', '#275073', '#1DBD9D', '#275073', '#1DBD9D', '#275073','#1DBD9D', '#275073','#1DBD9D', '#275073'];
        var chart = c3.generate({
            bindto: '#chartVerticalBarM3',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                labels: true,
                empty: { label: { text: "No Data Available" }   },
                color: function (color, d) {return colors[d.index];}
            },
            bar: {
                width: {ratio: 0.5} // this makes bar width 50% of length between ticks
            },
            size: {height:233},
            axis: {
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    },
                    label: {
                        text: 'Count',
                        position: 'outer-middle',
                    }
                  },
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chart.transform('bar');
        }, 0);
    }
    
    this.displayVerticalBarChart4 = function (data) { 
        var chart = null;
        var xaxis = 'x' ;
        data[0].unshift(xaxis);

         var colors = ['#1DBD9D', '#275073', '#1DBD9D', '#275073', '#1DBD9D', '#275073','#1DBD9D', '#275073','#1DBD9D', '#275073'];
        var chart = c3.generate({
            bindto: '#chartVerticalBar4',
            data: {
                x: xaxis,
                columns: [data[0],
                        data[1]],
                type: 'bar',
                labels: true,
                empty: { label: { text: "No Data Available" }   },
                color: function (color, d) {return colors[d.index];}
            },
            bar: {
                width: {ratio: 0.5} // this makes bar width 50% of length between ticks
            },
            size: {height:233},
            axis: {
                x: {type: 'category'},
                y: {// display only whole numbers on y axis (this is a inverted bar graph!)
                    tick: {
                      format: function (x) { return (x == Math.floor(x)) ? x: ""; }
                    },
                    label: {
                        text: 'Count',
                        position: 'outer-middle',
                    }
                  },
            },
            tooltip: {
                show: false
            }
        });
        setTimeout(function () {
            chart.transform('bar');
        }, 0);
    }
});