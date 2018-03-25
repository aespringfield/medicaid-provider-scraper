let myApp = angular.module('myApp', ['ngRoute']);

myApp.config(function($routeProvider, $locationProvider){
   $locationProvider.hashPrefix('');
   console.log('myApp --config');
   $routeProvider
   .when('/home',{
       templateUrl: '/views/home.html',
       controller: 'HomeController as hc',
   }).when('/info',{
       templateUrl: '/views/info.html',
       controller: 'InfoController as ic'
   })
   .when('/',{
    templateUrl: '/views/home.html',
    controller: 'HomeController as hc',
}).otherwise({
       redirect: 'home',
   })
});