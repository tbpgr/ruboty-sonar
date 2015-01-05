# encoding: utf-8
require 'spec_helper'
require 'ruboty-sonar'
require 'gems'

# rubocop: disable LineLength
describe RubotySonar do
  context :info do
    let(:gems_mock) do
      {
        'name' => 'ruboty-megen',
        'downloads' => 364,
        'version' => '1.0.1',
        'version_downloads' => 121,
        'platform' => 'ruby',
        'authors' => 'tbpgr',
        'info' => 'ruboty-megen generate ruboty README.md template.',
        'licenses' => ['MIT'],
        'project_uri' => 'http://rubygems.org/gems/ruboty-megen',
        'gem_uri' => 'http://rubygems.org/gems/ruboty-megen-1.0.1.gem',
        'homepage_uri' => 'https://github.com/tbpgr/ruboty-megen',
        'wiki_uri' => nil,
        'documentation_uri' => nil,
        'mailing_list_uri' => nil,
        'source_code_uri' => nil,
        'bug_tracker_uri' => nil,
        'dependencies' =>         { 'development' =>            [{ 'name' => 'bundler', 'requirements' => '~> 1.6' },
                                                                 { 'name' => 'rake', 'requirements' => '~> 10.0' },
                                                                 { 'name' => 'rspec', 'requirements' => '>= 0' },
                                                                 { 'name' => 'simplecov', 'requirements' => '>= 0' }],
                                    'runtime' => [{ 'name' => 'thor', 'requirements' => '~> 0.18.1' }]
        }
      }
    end
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        gem_name: 'ruboty-megen',
        expected: {
          name: 'ruboty-megen',
          desc: 'ruboty-megen generate ruboty README.md template.',
          downloads: 364,
          rubygems_uri: 'http://rubygems.org/gems/ruboty-megen',
          homepage_uri: 'https://github.com/tbpgr/ruboty-megen'
        }
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow(Gems).to receive(:info).and_return(gems_mock)

          # -- when --
          actual = RubotySonar.info(c[:gem_name])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end

  context :random do
    let(:gems_mock) do
      [
        {
          'name' => 'ruboty-megen',
          'downloads' => 364,
          'version' => '1.0.1',
          'version_downloads' => 121,
          'platform' => 'ruby',
          'authors' => 'tbpgr',
          'info' => 'ruboty-megen generate ruboty README.md template.',
          'licenses' => ['MIT'],
          'project_uri' => 'http://rubygems.org/gems/ruboty-megen',
          'gem_uri' => 'http://rubygems.org/gems/ruboty-megen-1.0.1.gem',
          'homepage_uri' => 'https://github.com/tbpgr/ruboty-megen',
          'wiki_uri' => nil,
          'documentation_uri' => nil,
          'mailing_list_uri' => nil,
          'source_code_uri' => nil,
          'bug_tracker_uri' => nil,
          'dependencies' =>           { 'development' =>              [{ 'name' => 'bundler', 'requirements' => '~> 1.6' },
                                                                       { 'name' => 'rake', 'requirements' => '~> 10.0' },
                                                                       { 'name' => 'rspec', 'requirements' => '>= 0' },
                                                                       { 'name' => 'simplecov', 'requirements' => '>= 0' }],
                                        'runtime' => [{ 'name' => 'thor', 'requirements' => '~> 0.18.1' }]
          }
        }
      ]
    end

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: {
          name: 'ruboty-megen',
          desc: 'ruboty-megen generate ruboty README.md template.',
          downloads: 364,
          rubygems_uri: 'http://rubygems.org/gems/ruboty-megen',
          homepage_uri: 'https://github.com/tbpgr/ruboty-megen'
        }
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow(RubotySonar).to receive(:search).and_return(gems_mock)

          # -- when --
          actual = RubotySonar.random

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end

  context :ranking do
    let(:gems_mock) do
      [
        {
          'name' => 'ruboty-megen1',
          'downloads' => 364,
          'authors' => 'tbpgr1'
        },
        {
          'name' => 'ruboty-megen2',
          'downloads' => 363,
          'authors' => 'tbpgr2'
        },
        {
          'name' => 'ruboty-megen3',
          'downloads' => 365,
          'authors' => 'tbpgr4'
        },
        {
          'name' => 'ruboty-megen3',
          'downloads' => 360,
          'authors' => 'tbpgr2'
        },
        {
          'name' => 'ruboty-megen3',
          'downloads' => 362,
          'authors' => 'tbpgr6'
        }
      ]
    end

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        limit: 3,
        expected: [
          { name: 'ruboty-megen3', downloads: 365, authors: 'tbpgr4' },
          { name: 'ruboty-megen1', downloads: 364, authors: 'tbpgr1' },
          { name: 'ruboty-megen2', downloads: 363, authors: 'tbpgr2' }
        ]
      },
      {
        case_no: 2,
        case_title: 'valid case (default limit)',
        expected: [
          { name: 'ruboty-megen3', downloads: 365, authors: 'tbpgr4' },
          { name: 'ruboty-megen1', downloads: 364, authors: 'tbpgr1' },
          { name: 'ruboty-megen2', downloads: 363, authors: 'tbpgr2' },
          { name: 'ruboty-megen3', downloads: 362, authors: 'tbpgr6' },
          { name: 'ruboty-megen3', downloads: 360, authors: 'tbpgr2' }
        ]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow(RubotySonar).to receive(:search).and_return(gems_mock)

          # -- when --
          if c[:limit]
            actual = RubotySonar.ranking(c[:limit])
          else
            actual = RubotySonar.ranking
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end

  context :author_ranking do
    let(:gems_mock) do
      [
        {
          'name' => 'ruboty-megen1',
          'downloads' => 364,
          'authors' => 'tbpgr1'
        },
        {
          'name' => 'ruboty-megen2',
          'downloads' => 363,
          'authors' => 'tbpgr1'
        },
        {
          'name' => 'ruboty-megen3',
          'downloads' => 365,
          'authors' => 'tbpgr2'
        },
        {
          'name' => 'ruboty-megen3',
          'downloads' => 360,
          'authors' => 'tbpgr2'
        },
        {
          'name' => 'ruboty-megen3',
          'downloads' => 362,
          'authors' => 'tbpgr3'
        },
        {
          'name' => 'ruboty-megen4',
          'downloads' => 462,
          'authors' => 'tbpgr4'
        },
        {
          'name' => 'ruboty-megen5',
          'downloads' => 562,
          'authors' => 'tbpgr5'
        }
      ]
    end

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        limit: 3,
        expected: [
          { authors: 'tbpgr1', downloads: 727 },
          { authors: 'tbpgr2', downloads: 725 },
          { authors: 'tbpgr5', downloads: 562 }
        ]
      },
      {
        case_no: 2,
        case_title: 'valid case (default limit)',
        expected: [
          { authors: 'tbpgr1', downloads: 727 },
          { authors: 'tbpgr2', downloads: 725 },
          { authors: 'tbpgr5', downloads: 562 },
          { authors: 'tbpgr4', downloads: 462 },
          { authors: 'tbpgr3', downloads: 362 }
        ]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow(RubotySonar).to receive(:search).and_return(gems_mock)

          # -- when --
          if c[:limit]
            actual = RubotySonar.author_ranking(c[:limit])
          else
            actual = RubotySonar.author_ranking
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end
end
# rubocop: enable LineLength
