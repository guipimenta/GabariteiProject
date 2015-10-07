(function() {

    angular
        .module(APP_NAME)
        .factory('Course', Course);

    Course.$inject = ['$resource'];

    function Course($resource) {
        return $resource('courses/:id.json', {id: '@id'}, {
        	update: { method: 'PUT' },
        	searchUsers: {
        		url: 'courses/:id/search_users',
        		method: 'GET',
        		isArray: true
        	},
            removeParticipant: {
                url: 'courses/:id/remove_participant/:user_id',
                method: 'PUT'
            }
        });
    }

})();