## PMS시스템 (프로젝트 매니저 시스템)

<br>

## 담당파트

> 프로젝트 작업관리

> 프로젝트별 채팅기능

<br>

## 기간

> 2021.04.01 ~ 2021.04.30
<br>

## 사용기술

> Spring Framwork 사용
> 
> DHTMLX Gantt API 사용
> 
> JSON데이터를 이용한 AJAX 비동기식 처리
> 
> WebSocket을 활용한 채팅
> 
> MVC2 패턴 사용
>
> Jquery 및 el, JSTL 라이브러리 사용
> 

<br>

## 어려웠던 점

#### 1. ajax내에서 반복/조건 처리 및 

* 기존 jsp에서 사용한 <c:foreach>태그를 ajax로 작성시 적용되지 않았음.

  * ajax내에서 jstl은 적용되지않아 자바코드 for문/if문을 사용하여 처리해야만 적용 가능.

* Gantt api에서 제공되는 properties를 제외한 나머지 properties 선언 및 할당 처리.
  
  * 

#### 2. Gantt 내 계정(직책)에 따라 부여되는 권한 처리.




