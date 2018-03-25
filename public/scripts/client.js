const myApp = angular.module('myApp', ['ngRoute','ngMap']);

myApp.config(function($routeProvider, $locationProvider){
   $locationProvider.hashPrefix('');
   console.log('myApp --config');
   $routeProvider
   .when('/',{
       templateUrl: '/views/home.html',
       controller: 'HomeController as hc',
   }).when('/home',{
    templateUrl: '/views/home.html',
    controller: 'HomeController as hc',})
    .when('/info',{
       templateUrl: '/views/info.html',
       controller: 'InfoController as ic'
   }).otherwise({
       redirect: '/home',
   })
});