package healthcheck


import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)


func TestPingRoute(t *testing.T) {
	router := prepareRouter()
	recorder := performRequest(router,http.MethodGet, "/healthcheck")
	response, err := readJson(recorder)
	status, exists := response["status"]

	assert.Equal(t, http.StatusOK, recorder.Code)
	assert.Nil(t, err)
	assert.True(t, exists)
	assert.Equal(t, "UP", status)
}

func prepareRouter() http.Handler {
	router := gin.Default()

	MountRoutes(router)

	return router
}

func performRequest(handler http.Handler, method, path string) *httptest.ResponseRecorder {
	req, _ := http.NewRequest(method, path, nil)
	recorder := httptest.NewRecorder()

	handler.ServeHTTP(recorder, req)

	return recorder
}

func readJson(recorder *httptest.ResponseRecorder) (map[string]string, error) {
	var response map[string]string

	err := json.Unmarshal([]byte(recorder.Body.String()), &response)

	return response, err
}
