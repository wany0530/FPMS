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

* 기존 jsp에서 사용한 <c:foreach>태그를 ajax로 작성시 적용되지 않았다.

  * ajax내에서 jstl은 적용되지않아 자바코드 for문/if문을 사용하여 처리해야만 적용 가능(해결)

<br>
  
![zenkit_question_solution2](https://user-images.githubusercontent.com/77144929/115964814-28367380-a561-11eb-9318-767eb0c62da9.PNG)


* Gantt에서 수정/등록을 위한 lightbox 내부 속성 영역 추가 작업 난항.
  
  * api에서 제공하는 section 메소드(gantt.config.lightbox.sections)를 통해 원하는 속성들을 정의하여 표시 (해결)
 
<br>
  
  ![image](https://user-images.githubusercontent.com/77144929/115965038-2caf5c00-a562-11eb-8967-80af65aa5945.png)

<br>

### 느낀점
> 간트차트 API, 캘린더API, 부트스트랩 등 만들어진 라이브러리 또는 API를 사용함으로써 쉽게 원하는 기능을 구현할 수 있었다.
>
> 하지만 부트스트랩의 li를 ajax에 활용하여 값을 넣었는데 개발자 모드에서는 적용이 되었지만,
> 
> 실제로 UI 상에는 적용 되지 않은 현상이 발생하였다. 원인을 파악한 결과로 단순히 li태그로만 이루어진것이 아니라
> 
> div를 비롯하여 다양한 태그와 연관이 있었고, 부트스트랩이 적용되기 전에 Ajax로 데이터를 구성함으로써 해결할 수 있었다.

![image](https://user-images.githubusercontent.com/77144929/115965697-47370480-a565-11eb-85c3-bfdfe81105b2.png)




