let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
let options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.4778757511289, 126.8789958944023), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

let places = new kakao.maps.services.Places();

const inputKeyword = document.querySelector("#inputKeyword");
const searchIcon = document.querySelector("#searchIcon");

places.setMap(map);

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
let infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 주소-좌표 변환 객체를 생성합니다
let geocoder = new kakao.maps.services.Geocoder();
// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

/*********************Marker 선언부**********************************/

// 마커를 담을 배열입니다
let markers = [];

let imageSrc = '/resources/images/meetingboard/map_marker_icon.svg'; // 마커 이미지 url
let imageSize = new kakao.maps.Size(50, 60);  // 마커 이미지의 크기
let imgOptions =  {
        spriteSize : new kakao.maps.Size(50, 60), // 소스 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, (markers.length*46)+10),
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    };
let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);

// 지도를 클릭한 위치에 표출할 마커입니다
let clickMarker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter(),
    image: markerImage
});

/*********************************************************/

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

    clickMarker.setMap(null);
    infowindow.close();

    // 클릭한 위도, 경도 정보를 가져옵니다 
    let latlng = mouseEvent.latLng; 
    
    let message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    console.log(message);

    searchDetailAddrFromCoords(latlng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            let detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            let content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            clickMarker.setPosition(latlng);
            clickMarker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, clickMarker);
        }   
    });

    // 지도에 마커를 표시합니다
    //clickMarker.setMap(map);
    //markers.push(clickMarker);  // 배열에 생성된 마커를 추가합니다
    //console.log(markers);
});

/**************************************************************/

// 검색 아이콘 클릭 시
searchIcon.addEventListener("click", function(){
    let keyword = inputKeyword.value;

    if(!keyword.replace(/^\s+|\s+$/g, '')){
        alert('키워드를 입력해주세요!');
        return false;
    }

    places.keywordSearch(keyword, keywordSearchCallback);
});

// 장소 검색 완료시 호출되는 함수
let keywordSearchCallback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log(result);

        keywordSearchDisplayplace(result);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
};

// 검색 결과 목록과 마커를 표출하는 함수
function keywordSearchDisplayplace(result){
    
    const placesListFrame = document.querySelector("#placesListFrame");
    const placesList = document.querySelector("#placesList");
    let fragment = document.createDocumentFragment();
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    // LatLngBounds 객체에 좌표를 추가합니다
    let bounds = new kakao.maps.LatLngBounds(); 

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(placesList);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    for(let i = 0; i < result.length; i++){

        let placePosition = new kakao.maps.LatLng(result[i].y, result[i].x);
        let createdMarker = addMarker(placePosition, i);
        let placesListItem = getListItem(i, result[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            placesListItem.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            placesListItem.onmouseout =  function () {
                infowindow.close();
            };
        })(createdMarker, result[i].place_name);

        placesListItem.addEventListener("click", function(index){
            
        });

        fragment.appendChild(placesListItem);

    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    placesList.appendChild(fragment);
    placesListFrame.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);

}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, place) {

    let placesListItem = document.createElement('li');

    let placesListItemDivUp = document.createElement("div");
    placesListItemDivUp.setAttribute("class", "ms-2 me-auto placesListItemDivUp");
    let placesListItemDivDown = document.createElement("div");
    placesListItemDivDown.setAttribute("class", "ms-2 me-auto placesListItemDivDown");

    let placesListItemDivTitle = document.createElement("div");
    placesListItemDivTitle.setAttribute("class", "placesListItemDivTitle d-inline-block");
    let placesListItemSpanTitle = document.createElement("span");
    placesListItemSpanTitle.setAttribute("class", "badge bg-primary rounded-pill placesListItemCategory");
    let placesListItemSpanDetail = document.createElement("span");
    placesListItemSpanDetail.setAttribute("class", "badge bg-primary rounded-pill placesListItemCategory");

    placesListItemDivTitle.innerText = place.place_name;
    placesListItemDivUp.appendChild(placesListItemDivTitle);

    if (place.road_address_name) {
        placesListItemDivDown.appendChild(document.createTextNode(place.road_address_name));
    } else {
        placesListItemDivDown.appendChild(document.createTextNode(place.address_name));
    }

    if(place.category_name){
        const splitedCategory = place.category_name.split('>');
        const mainCategory = splitedCategory[0];
        const subCategory = splitedCategory[splitedCategory.length - 1];
        placesListItemSpanTitle.appendChild(document.createTextNode(mainCategory));
        placesListItemSpanDetail.appendChild(document.createTextNode(subCategory));
        placesListItemDivUp.appendChild(placesListItemSpanTitle);
        placesListItemDivUp.appendChild(placesListItemSpanDetail);
    }

    placesListItem.append(placesListItemDivUp);
    placesListItem.append(placesListItemDivDown);
    placesListItem.className = 'placesListItem list-group-item d-flex flex-column align-items-start';

    return placesListItem;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    imgOptions.spriteOrigin = new kakao.maps.Point(0, (idx*46)+10) // 이미지 중 사용할 영역의 좌상단 좌표
    let createdMarker = new kakao.maps.Marker({
        position: position, // 마커의 위치
        image: markerImage 
    });

    createdMarker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(createdMarker);  // 배열에 생성된 마커를 추가합니다

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(createdMarker, 'click', function() {
         console.log(idx + "번 마커 클릭함");
    });

    return createdMarker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for (let i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    //let content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    let template_map_marker = document.querySelector("#template-map-marker");
    let content = template_map_marker.innerHTML;
    content = content.replace('{storeTitle}', title);

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild(el.lastChild);
    }
}

/*******************************************************/

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        let infoDiv = document.getElementById('centerAddr');

        for(let i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}