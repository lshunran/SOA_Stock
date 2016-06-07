package com.demo.client;

/**
 * Created by ashun on 16/6/6.
 */
public class App {

    public static void main(String[] args) {
        // TODO Auto-generated method stub

        /**
         * <service name="MyService">
         * 获得服务名称
         */
        HelloWorldService mywebService = new HelloWorldService();

        /**
         * <port name="HelloServicePort" binding="tns:HelloServicePortBinding">
         */
        HelloWorld hs = mywebService.getHelloWorldPort();

        /**
         * 调用方法
         */
        System.out.println(hs.sayHelloWorldFrom("sjk"));

        //System.out.println(hs.aliassayHello("sjk"));



    }
}
